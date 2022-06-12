; --------------------------------------------------
; 共通関数
; --------------------------------------------------

; ##################################################
; アプリをアクティブにする(アプリが未起動の場合は起動)。
; param exeFile : exeファイル名
; fullPath : exeのフルパス
; ##################################################
RunOrActivate(exeFile, fullPath) {
    try {
        IFWinNotExist, ahk_exe %exeFile%
            Run, %fullPath%
        WinWait, ahk_exe %exeFile%
        Winactivate, ahk_exe %exeFile%
    } Catch e {
        MsgBox, e
    }
}


; ##################################################
; アプリの表示・非表示(アプリが未起動の場合は起動する)。
; param exeFile : exeファイル名
; fullPath : exeのフルパス
; ##################################################
ToggleApp(exeFile, fullPath) {
    try {
        IFWinNotExist, ahk_exe %exeFile% 
        {
            Run, %fullPath%
            WinWait, ahk_exe %exeFile%
            Winactivate, ahk_exe %exeFile%
        } Else {
            Sleep 100
            IFWinActive, ahk_exe %exeFile%
            {
                WinMinimize, ahk_exe %exeFile%
            } Else {
                WinRestore, ahk_exe %exeFile%
                WinWait, ahk_exe %exeFile%
                Winactivate, ahk_exe %exeFile%
            }
        }
    } Catch e {
        MsgBox, e
    }
}


; ##################################################
; マウスホイールのエミュレート
; param button : WheelLeft/WheelDown/WheelUp/WheelRight
; ##################################################
WheelMouse(button) {
    MouseClick,%button%,,,1,0,D,R
}


; ##################################################
; アクティブウィンドウの移動
; param direction : 移動方向
; ##################################################
MoveActiveWindow(direction) {
    offset = 50
    WinGetPos, x, y, w, h, A
    if direction = LEFT
        x -= offset
    else if direction = BOTTOM
        y += offset
    else if direction = TOP
        y -= offset
    else
        x += offset
    WinMove, A,, %x%, %y%
}


; ##################################################
; アクティブウィンドウの移動
; param size : サイズ
; ##################################################
ResizeActiveWindow(size) {
    offset = 50
    WinGetPos, x, y, w, h, A
    ; if direction = 0
    ;     w -= offset
    ; else if direction = 1
    ;     h += offset
    ; else if direction = 2
    ;     h -= offset
    ; else
    ;     w += offset
    if size = NARROW
        w -= offset
    else if size = HIGH
        h += offset
    else if size = LOW
        h -= offset
    else
        w += offset
    WinMove, A,,,, %w%, %h%
}


; ##################################################
; 指定したモニタの情報を取得する
; param index : モニターのインデックス
; param monitorWidth : モニターの幅(ref)
; param monitorHeight : モニターの高さ(ref)
; param monitorOriginX : モニター起点のX座標
; ##################################################
GetMonitorInfo(index, byref monitorWidth, byref monitorHeight, byref monitorOriginX) {
    SysGet, Monitor_A, Monitor, %index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %index%
    monitorWidth := MonitorWorkAreaRight - MonitorWorkAreaLeft
    monitorHeight := MonitorWorkAreaBottom - MonitorWorkAreaTop
    monitorOriginX := MonitorWorkAreaLeft
}


; ##################################################
; カレントモニタのインデックスを取得(ウィンドウ基準)
; return インデックス
; remark モニタは２台の前提
; ##################################################
GetCurrentMonitorIndex() {
    CoordMode, Mouse, Screen
    SysGet, MonitorCount, MonitorCount
    if (2 <> MonitorCount) {
        return 1
    }
    index = 2
    WinGetPos, x, y, w, h, A
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    if (MonitorWorkAreaLeft <= x && x <= MonitorWorkAreaRight) {
        index := 1
    }
    return index
}


; ##################################################
; カレントモニタのインデックスを取得(マウス基準)
; return インデックス
; remark モニタは２台の前提
; ##################################################
GetCurrentMonitorIndexBaseOnMouse() {
    CoordMode, Mouse, Screen
    SysGet, MonitorCount, MonitorCount
    if (2 <> MonitorCount) {
        return 1
    }
    index = 2
    MouseGetPos, x, y
    SysGet, MonitorWorkArea, MonitorWorkArea, 1
    if (MonitorWorkAreaLeft <= x && x <= MonitorWorkAreaRight) {
        index := 1
    }
    return index
}


; ##################################################
; カレントモニタのインデックスを取得
; position 位置
; ##################################################
MoveCursor(position) {
    GetMonitorInfo(GetCurrentMonitorIndexBaseOnMouse(), monitorWidth, monitorHeight, monitorOriginX)
    offset = 30
    if (position = "LEFTTOP") {
        x := monitorOriginX + offset
        y := offset
    } else if (position = "LEFTCENTER") {
        x := monitorOriginX + offset
        y := monitorHeight / 2
    } else if (position = "LEFTBOTTOM") {
        x := monitorOriginX + offset
        y := monitorHeight - offset
    } else if (position = "CENTERTTOP") {
        x := monitorOriginX + monitorWidth / 2
        y := offset
    } else if (position = "CENTER") {
        x := monitorOriginX + monitorWidth / 2
        y := monitorHeight / 2
    } else if (position = "CENTERBOTTOM") {
        x := monitorOriginX + monitorWidth / 2
        y := monitorHeight - offset
    } else if (position = "RIGHTTOP") {
        x := monitorOriginX + monitorWidth - offset
        y := offset
    } else if (position = "RIGHTCENTER") {
        x := monitorOriginX + monitorWidth - offset
        y := monitorHeight / 2
    } else if (position = "RIGHTBOTTOM") {
        x := monitorOriginX + monitorWidth - offset
        y := monitorHeight - offset
    }
    MouseMove, %x%, %y%
}


; ##################################################
; キーの送信
; key 送信するキー
; keyIfShift Shift押下時に送信するキー
; ##################################################
SendInputKey(key, keyIfShift) {
  if GetKeyState("Shift") {
    SendRaw, %keyIfShift%
  } else {
    SendRaw, %key%
  }
  return
}