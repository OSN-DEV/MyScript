; --------------------------------------------------
; AutoHotkey起動時処理
; --------------------------------------------------

; スクリプトを明示的に常駐させる
#Persistent
; 同一スクリプトを実行した場合は、確認なくリロードする
#SingleInstance, Force
; Windwos環境変数の検索をしない
#NoEnv
; RegiterHotkeyを介さずフックを使用する
#UseHook
; キーボードフックを有効にする(for debug)
#InstallKeybdHook
; マウスフックを有効化する(for debug)
#InstallMouseHook
; 無限ループの検出間隔
; #HotkeyInterval, 2000
#HotkeyInterval,1000
; 無限ループとして警告するループ回数の閾値
; #MaxHotkeysPerInterval, 200
#MaxHotkeysPerInterval, 100
; プロセスの優先度(最高設定)
Process, Priority,, Realtime
; SendコマンドのモードをInputにする(send_keyじゃなくてinput_keyを使用するということらしい。input_keyの方が高速？)
SendMode, Input
; 作業フォルダ(AutoHotKey.ahk)を含むフォルダ
SetWorkingDir %A_ScriptDir%
; WindowTitleを部分一致検索にする
SetTitleMatchMode, 2
; Auto-executeの終端。オリジナルのスクリプトは、Return以降に記述する。
