# Linux用Windowsサブシステムのオプション機能を有効にする
Start-Process -FilePath dism -ArgumentList "/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /nonrestart" -Verb runAs

# 仮想マシンプラットフォームのオプション機能を有効にする
Start-Process -FilePath dism -ArgumentList "/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart" -Verb runAs

# WSL2を既定のバージョンとして設定する
wsl --set-default-version 2

