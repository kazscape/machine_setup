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

# ログファイルの出力停止
Stop-Transcript