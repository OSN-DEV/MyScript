#Include %A_ScriptDir%\Launch.ahk
#Include %A_ScriptDir%\Functions.ahk

; --------------------------------------------------
; モニターの情報を取得
; --------------------------------------------------
GetMonitorInfo(1, monitorLWidth, monitorLHeight, monitorLOriginX)
GetMonitorInfo(2, monitorRWidth, monitorRHeight, monitorROriginX)
return


; --------------------------------------------------
; スクリプトのリロード・編集
; --------------------------------------------------
^+!R::Reload            ; Ctrl + Shift + Alt + r
^+!E::Edit              ; Ctrl + Shift + Alt + e


; --------------------------------------------------
; キー送信
; --------------------------------------------------
; 右シフト
RShift & s::SendInput, !{Tab}               ; Alt + Tab(Shift + s)


; F12
;F12 & 0::
;    WinMove, A,,,, 1400, 800
;    return


; --------------------------------------------------
; アプリ起動
; --------------------------------------------------
; HorizontalBook(RShift + z)
RShift & z::RunOrActivate("MyHolizontalBookViewerLight.exe", "E:\UserData\app\dotnet\MyHolizontalBookViewerLight\src\bin\Debug\MyHolizontalBookViewerLight.exe")

; VSCode(RShift + x)
RShift & x::RunOrActivate("Code.exe", "D:\NoInstall\VisualStudioCode\VSCode\Code.exe")

; GomiHTML(RShift + C)
RShift & c::RunOrActivate("GomiHtml.exe", "E:\UserData\app\dotnet\GomiHTML\bin\Debug\GomiHtml.exe")

; terminal(Ctrl + Shift + Alt + Space)
^+!Space::RunOrActivate("WindowsTerminal.exe", "WT")

; 下書き用テキスト
^+!W::Run, "F:\OneDrive\Business\OneDrive - PrivateSpace\00.inbox\下書き.md"

; --------------------------------------------------
; マウス
; --------------------------------------------------
; マウスカーソルの移動
^!U::MoveCursor("LEFTTOP")          ; 左上に移動(Ctrl + Alt + U)
^!J::MoveCursor("LEFTCENTER")       ; 左中央に移動(Ctrl + Alt + J)
^!M::MoveCursor("LEFTBOTTOM")       ; 左下に移動(Ctrl + Alt + M)
^!I::MoveCursor("CENTERTTOP")       ; 中央上に移動(Ctrl + Alt + I)
^!K::MoveCursor("CENTER")           ; 中央に移動(Ctrl + Alt + K)
^!,::MoveCursor("CENTERBOTTOM")     ; 中央下に移動(Ctrl + Alt + ,)
^!O::MoveCursor("RIGHTTOP")         ; 右上に移動(Ctrl + Alt + O)
^!L::MoveCursor("RIGHTCENTER")      ; 右中央に移動(Ctrl + Alt + L)
^!.::MoveCursor("RIGHTBOTTOM")      ; 右下に移動(Ctrl + Alt + .)

; マウスカーソルをアクティブウィンドウの中央に移動(Ctr + Shift + X)
^+X::
    WinGetPos, x, y, w, h, A
    newX := x + (w / 2)
    newY := y + (h / 2)
    ;MsgBox, %x%, %y%, %w%, %h%
    CoordMode, Mouse,Screen
    MouseMove, %newX%, %newY%
return


^!sc028::MouseClick, Left,,,,,D      ; 左クリック(Ctrl + Alt + :)
^!sc028 UP::MouseClick, Left,,,,,U
^!]::MouseClick, Right            ; 右クリック(Ctrl + Alt + ])

^!Up::MouseMove 0, -10, 0, R      ; カーソルを上に移動(Ctrl + Alt + ↑)
^+!Up::MouseMove 0, -50, 0, R     ; カーソルを上に移動(Ctrl + Shift + Alt + ↑)
^!Down::MouseMove 0, 10, 0, R     ; カーソルを上に移動(Ctrl + Alt + ↓)
^+!Down::MouseMove 0, 50, 0, R    ; カーソルを上に移動(Ctrl + Shift + Alt + ↓)
^!Left::MouseMove -10, 0, 0, R    ; カーソルを左に移動(Ctrl + Shift + Alt + ←)
^+!Left::MouseMove -50, 0, 0, R   ; カーソルを左に移動(Ctrl + Shift + Shift + Alt + ←)
^!Right::MouseMove 10, 0, 0, R    ; カーソルを右に移動(Ctrl + Alt + →)
^+!Right::MouseMove 50, 0, 0, R   ; カーソルを右に移動(Ctrl + Shift + Alt + →)


; --------------------------------------------------
; ウィンドウ
; --------------------------------------------------
; アクティブウィンドウを移動
^+7::MoveActiveWindow("LEFT")       ; 左方向に移動(Ctrl + Shift + 7)
^+8::MoveActiveWindow("BOTTOM")     ; 下方向に移動(Ctrl + Shift + 8)
^+9::MoveActiveWindow("TOP")        ; 上方向に移動(Ctrl + Shift + 9)
^+0::MoveActiveWindow("RIGHT")      ; 右方向に移動(Ctrl + Shift + 0)


; アクティブウィンドウのサイズ変更
^+!7::ResizeActiveWindow("NARROW")  ; 幅の縮小(Ctrl + Shift + Alt + 7)
^+!8::ResizeActiveWindow("HIGH")    ; 高さの拡大(Ctrl + Shift + Alt + 8)
^+!9::ResizeActiveWindow("LOW")     ; 高さの縮小(Ctrl + Shift + Alt + 9)
^+!0::ResizeActiveWindow("WIDE")    ; 幅の拡大(Ctrl + Shift + Alt + 0)
^+!U::WinMaximize, A                ; ウィンドウを最大化(Ctrl + Shift + Alt + U)
^+!J::WinRestore, A                 ; ウィンドウをリストア(Ctrl + Shift + Alt + J)
^+!M::WinMinimize, A                ; ウィンドウを最小化(Ctrl + Shift + Alt + M)

#+J::                               ; ウィンドウをサイズそのままに左に配置(Win + Shift + J)
    GetCurrentMonitorInfo(ml, mw, mh)
    WinGetPos, x, y, w, h, A
    if (h < mh) {
        newY := (mh - h) / 2
    } else {
      newY := 0
    }
    WinMove, A,, 0, %newY%
return

#+K::                               ; ウィンドウをサイズそのままに中央に配置(Win + Shift + K)
    GetCurrentMonitorInfo(ml, mw, mh)
    WinGetPos, x, y, w, h, A
    if (h < mh) {
        newY := (mh - h) / 2
    } else {
      newY := 0
    }
    if (w < mw) {
      newX := (mw - w) / 2
    } else {
      newX := 0
    }
    WinMove, A,, %newX%, %newY%
return

#+L::                               ; ウィンドウをサイズそのままに右に配置(Win + Shift + L)
    GetCurrentMonitorInfo(ml, mw, mh)
    WinGetPos, x, y, w, h, A
    if (h < mh) {
        newY := (mh - h) / 2
    } else {
      newY := 0
    }
    if (w < mw) {
      newX := (mw - w)
    } else {
      newX := 0
    }
    WinMove, A,, %newX%, %newY%
return

; ウィンドウを画面中央に配置(Ctrl + Shift + Alt + K)
^+!K::
    GetCurrentMonitorInfo(ml, mw, mh)
    w := mw / 2
    h := mh * 4 / 5
    x := ml + (mw - w) / 2
    y := (mh - h) / 2
    WinMove, A,, %x%, %y%, %w%, %h% 
return



; ウィンドウを反対のモニタの中央に配置(Shift + Win + U)
+#U::
    global monitorROriginX
    global monitorLWidth
    global monitorRWidth
    global monitorLHeight
    global monitorRHeight

    index := GetCurrentMonitorIndex()
    monitorX := (index == 1) ? monitorROriginX : monitorLOriginX
    monitorWidth := (index == 1) ? monitorRWidth : monitorLWidth
    monitorHeight := (index == 1) ? monitorRHeight : monitorLHeight
 
    WinGetPos, windowX, windowY, windowWidth, windowHeight, A
    if (monitorWidth < windowWidth) {
        x := monitorX
    } else {
        x := monitorX + (monitorWidth - windowWidth) / 2
    }
    WinMove, A,, %x%, %windowY%, %windowWidth%, %windowHeight%

    CoordMode, Mouse,Screen
    x := monitorX + (monitorWidth / 2)
    y := monitorHeight / 2
    MouseMove, %x%, %y%


    return




; --------------------------------------------------
; メソッド(グローバル変数を参照するもの)
; --------------------------------------------------
GetCurrentMonitorInfo(byref ml, byref mw, byref mh) {
    global monitorLOriginX
    global monitorROriginX
    global monitorLWidth
    global monitorRWidth
    global monitorLHeight
    global monitorRHeight
    index := GetCurrentMonitorIndex()
    ml := (index == 1) ? monitorLOriginX : monitorROriginX
    mw := ((index == 1) ? monitorLWidth : monitorRWidth)
    mh := (index == 1) ? monitorLHeight : monitorRHeight
}



; --------------------------------------------------
; デバッグ用
; --------------------------------------------------
Numpad0::
; SysGet, MonitorCount, MonitorCount
; SysGet, MonitorPrimary, MonitorPrimary
; MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
; Loop, %MonitorCount%
; {
;     SysGet, MonitorName, MonitorName, %A_Index%
;     SysGet, Monitor, Monitor, %A_Index%
;     SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
;     MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
; }
; return
    index := GetCurrentMonitorIndex()
    monitorX := (index == 1) ? monitorLOriginX : monitorLOriginX
    monitorWidth := (index == 1) ? monitorLWidth : monitorLWidth
    monitorHeight := (index == 1) ? monitorLHeight : monitorLHeight

    CoordMode, Mouse,Screen
    x := monitorX + (monitorWidth / 2)
    y := monitorHeight / 2
    ;MsgBox %x%: %y%
    MouseMove,% x, y
