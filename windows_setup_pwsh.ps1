# ログファイルの出力開始
Start-Transcript "./windows_setup_pwsh_log.txt"

# 実行ポリシーの取得
Get-ExecutionPolicy -List

# 実行ポリシーの変更
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force

# 実行ポリシーの取得
Get-ExecutionPolicy -List

# scoopのインストール
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# gitのインストール
scoop install git

# extras bucketを追加
scoop bucket add extras

# Visual Studio Codeのインストール
scoop install vscode

# Google Chromeのインストール
scoop install googlechrome

# Slackのインストール
scoop install slack

# Powershell coreのインストール
scoop install pwsh

# Windows Terminalのインストール
scoop install windows-terminal

# Winmergeのインストール
scoop install winmerge

# キャッシュのクリア
scoop cache rm *

# MesloLGS NFフォントのダウンロード
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"  -Outfile ".\MesloLGS NF Regular.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"  -Outfile ".\MesloLGS NF Bold.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"  -Outfile ".\MesloLGS NF Italic.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"  -Outfile ".\MesloLGS NF Bold Italic.ttf"

# フォントのインストール
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
dir .\*.ttf | %{ $fonts.CopyHere($_.fullname) }

# ファイルの削除
Remove-Item .\*.ttf


# ログファイルの出力停止
Stop-Transcript