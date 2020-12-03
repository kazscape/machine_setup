# ユーザフォルダパスの取得
$userprofile = $env:USERPROFILE

# プロファイル「Microsoft.PowerShell_profile.ps1」の削除
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# oh-my-poshモジュールのインストール
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Modules/oh-my-posh

# posh-gitモジュールの削除
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Modules/posh-git

# Windows Terminalのsettings.jsonの削除
if(Test-Path "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json") {
    Remove-Item "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json" -Force
}

# Winmergeのアンインストール
scoop uninstall winmerge

# Windows Terminalのアンインストール
scoop uninstall windows-terminal

# Powershell Coreのアンインストール
scoop uninstall pwsh

# Slackのアンインストール
scoop uninstall slack

# Google Chromeのアンインストール
scoop uninstall googlechrome

# Visual Studio Codeのコンテキストメニューからの削除
Start-Process -FilePath "reg" -ArgumentList "import ${userprofile}\scoop\apps\vscode\current\vscode-uninstall-context.reg"

# Visual Studio Codeのアンインストール
scoop uninstall vscode

# 7zipのアンインストール
scoop uninstall 7zip

# extras bucketをアンインストール
scoop bucket rm extras

# gitのアンインストール
scoop uninstall git

# scoopのアンインストール
scoop uninstall scoop
