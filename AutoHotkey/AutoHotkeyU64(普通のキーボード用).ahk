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
^+!R::Reload
^+!E::Edit




; --------------------------------------------------
; キー送信
; --------------------------------------------------
Numpad5::SendInput, !{Tab}                  ; Alt + Tab
Numpad6::SendInput, !{PrintScreen}          ; Alt + PrintScreen
Numpad7::SendInput, !{F4}                   ; Alt + F4
Numpad9::SendInput, ^{F4}                   ; Ctrl + F4
; vk1C & `;::SendInput, -                     ; 変換 + ;
; vk1C::SendInput, {vk1C}                     ; 変換
AppsKey::SendInput, {AppsKey}               ; App

; --------------------------------------------------
; キー送信(親指シフト)
; --------------------------------------------------
vk1C & q::SendInputKey(1, "!")               ; 1
vk1C & w::SendInputKey(2, """")              ; 2
vk1C & e::SendInputKey(3, "#")               ; 3
vk1C & r::SendInputKey(4, "$")               ; 4
vk1C & t::SendInputKey(5, "%")               ; 5
vk1C & y::SendInputKey(6, "&")               ; 6
vk1C & u::SendInputKey(7, "'")               ; 7
vk1C & i::SendInputKey(8, "(")               ; 8
vk1C & o::SendInputKey(9, ")")               ; 9
vk1C & p::SendInputKey(0, "")                ; 0
vk1C & `;::SendInputKey("-", "=")            ;  
vk1C & l::SendInputKey("p", "P")             ; p
vk1C::SendInput, {vk1C}

sc07B & l::SendInput, {Enter}
sc07B & n::SendInput, {Delete}
sc07B & m::SendInput, {Backspace}
sc07B & `;::SendInput, {ESC}

sc07B & a::SendInputKey("@", "``") 

sc07B & c::
    if IsShiftPressed() {
        Send, {{}
    } else {
        Send, [
    }
    return

sc07B & v::
    if IsShiftPressed() {
        Send, {}}
    } else {
        Send, ]
    }
    return

sc07B & j::
    if IsShiftPressed() {
        ;SendInput, {Home}
        Send, +{Home}
    } else {
        Send, {Home}
    }
    return

sc07B & K::
    if IsShiftPressed() {
        Send, +{End}
    } else {
        Send, {End}
    }
    return


sc07B & u::
    if IsShiftPressed() { 
        Send, +{Left} 
    } else { 
        Send, {Left}
    }
    return
sc07B & i::
    if IsShiftPressed() { 
        Send, +{Down} 
    } else { 
        Send, {Down}
    }
    return
sc07B & o::
    if IsShiftPressed() { 
        Send, +{Up} 
    } else { 
        Send, {Up}
    }
    return
sc07B & p::
    if IsShiftPressed() { 
        Send, +{Right} 
    } else { 
        Send, {Right}
    }
    return
sc07B & .::,
    if IsShiftPressed() { 
        Send, +{Tab} 
    } else { 
        Send, {Tab}
    }
    return
;sc07B & .::SendInput, {Tab}
sc07B::SendInput, {sc07B}




; --------------------------------------------------
; アプリ起動
; --------------------------------------------------
; Viewer(Tenkey 1)
Numpad1::RunOrActivate("MyHolizontalBookViewerLight.exe", "E:\UserData\app\dotnet\MyHolizontalBookViewerLight\src\bin\Debug\MyHolizontalBookViewerLight.exe")

; VSCode(Tenkey 2)
Numpad2::RunOrActivate("Code.exe", "D:\NoInstall\VisualStudioCode\VSCode\Code.exe")

; GomiHTML(Tenkey 3)
Numpad3::RunOrActivate("GomiHtml.exe", "E:\UserData\app\dotnet\GomiHTML\bin\Debug\GomiHtml.exe")

; Q-Dir(Ctrl + Alt + Space)
Numpad4::RunOrActivate("Q-Dir_x64.exe", "D:\NoInstall\Q-Dir\Q-Dir\Q-Dir_x64.exe")
^!Space::ToggleApp("Q-Dir_x64.exe", "D:\NoInstall\Q-Dir\Q-Dir\Q-Dir_x64.exe")


; gvim(Ctrl + Shift + Alt + G)
^+!G::RunOrActivate("gvim.exe", "D:\NoInstall\vim\vim\gvim.exe")

; cmder(Ctrl + Shift + Alt + Space)
; ^+!Space::ToggleApp("ConEmu64.exe", "D:\NoInstall\Cmder\mini\Cmder.exe")
^+!Space::ToggleApp("WindowsTerminal.exe", "WT")


; --------------------------------------------------
; マウス
; --------------------------------------------------
; マウスホイール
AppsKey & 7::WheelMouse("WheelLeft")
AppsKey & 8::WheelMouse("WheelDown")
AppsKey & 9::WheelMouse("WheelUp")
AppsKey & 0::WheelMouse("WheelRight")

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

; マウスカーソルを反対のモニタに移動(Ctrl + Alt + ;)
^!;::
    global monitorROriginX
    global monitorLWidth
    global monitorRWidth
    global monitorLHeight
    global monitorRHeight

    index := GetCurrentMonitorIndexBaseOnMouse()
    monitorX := (index == 1) ? monitorROriginX : monitorLOriginX
    monitorWidth := (index == 1) ? monitorRWidth : monitorLWidth
    monitorHeight := (index == 1) ? monitorRHeight : monitorLHeight
 
    CoordMode, Mouse,Screen
    x := monitorX + (monitorWidth / 2)
    y := monitorHeight / 2
    MouseMove, %x%, %y%


    return
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

; ウィンドウを画面中央に配置(Ctrl + Shift + Alt + K)
^+!K::
    GetCurrentMonitorInfo(ml, mw, mh)
    w := mw / 2
    h := mh * 4 / 5
    x := ml + (mw - w) / 2
    y := (mh - h) / 2
    WinMove, A,, %x%, %y%, %w%, %h% 
return

; ウィンドウの幅を半分にして左右に配置(Win + ←・→)
#Left::
GetCurrentMonitorInfo(ml, mw, mh)
w := mw / 2
WinMove, A,, %ml%, 0, %w%, %mh%     ; ここで計算式を入れると微妙にずれるので事前に計算しておく
return

#Right::
GetCurrentMonitorInfo(ml, mw, mh)
left := ml + (mw / 2)
w := mw / 2
WinMove, A,, %left%, 0, %w%, %mh%
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
; メソッド(その他)
; --------------------------------------------------
IsShiftPressed() {
    return GetKeyState("shift", "P")
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
    MsgBox %x%: %y%
    MouseMove,% x, y
