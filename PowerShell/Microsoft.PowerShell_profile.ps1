if ($env:WT_PROFILE_ID) {
    # Windows Terminalから実行されたときだけ変更する設定をここに記述する
    Import-Module oh-my-posh
    Set-PoshPrompt -Theme slim 
    $ENV:LESSCHARSET+="utf-8"
    $ENV:Path+=";D:\NoInstall\vim\vim\"
    $ENV:Path+=";D:\NoInstall\Python\python\"
    $ENV:Path+=";D:\NoInstall\Node\node\"
    $ENV:Path+=";D:\NoInstall\AndroidStudio\android-studio\jre\bin"
}