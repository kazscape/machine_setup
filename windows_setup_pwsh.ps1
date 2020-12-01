# ログファイルの出力開始
Start-Transcript "./windows_setup_pwsh_log.txt"

# 実行前のセキュリティポリシーの取得
Get-ExecutionPolicy -List

# 実行ポリシーを変更する
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force

# 実行前のセキュリティポリシーの取得
Get-ExecutionPolicy -List

# scoopのインストール
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# ログファイルの出力停止
Stop-Transcript