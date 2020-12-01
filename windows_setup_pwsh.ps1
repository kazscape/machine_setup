# ログファイルの出力開始
Start-Transcript "./windows_setup_pwsh_log.txt"

# 実行前のセキュリティポリシーの取得
echo "Before Set-ExecutionPolily"
Get-ExecutionPolicy -List

# 実行ポリシーを変更する
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force

# 実行前のセキュリティポリシーの取得
echo "`r`nAfter Set-ExecutionPolily"
Get-ExecutionPolicy -List