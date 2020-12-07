# ユーザフォルダパスの取得
$userprofile = $env:USERPROFILE

# PSGalleryの信頼する
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# posh-gitモジュールのインストール
Install-Module posh-git -Scope CurrentUser

# oh-my-poshモジュールのインストール
Install-Module oh-my-posh -Scope CurrentUser

# プロファイル「Microsoft.PowerShell_profile.ps1」の作成
$data = "Import-Module posh-git`r`nImport-Module oh-my-posh`r`nSet-Theme Powerlevel10k-Classic"
$data | Out-File "$userprofile\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Encoding default
