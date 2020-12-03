# ユーザフォルダパスの取得
$userprofile = $env:USERPROFILE

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
Start-Process -FilePath "reg" -ArgumentList "import ${userprofile}\scoop\apps\vscode\current\vscode-install-context.reg"

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

# settings.json作成のためにWindows Terminalの起動
Start-Process -FilePath "wt.exe"

# Windows Terminalの終了
Start-Sleep -Seconds 2
$pro = Get-Process WindowsTerminal
if ( $pro -ne $null ) {
    Stop-Process -Name WindowsTerminal
}

# Windows Terminalのsettings.jsonの取得
$data = Get-Content -Encoding Ascii "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json"

# Icebergカラースキーマの追加
$data = $data -replace "`"schemes`": \[\],", `
    "`"schemes`": [ `
    `t{ `
    `t`t`"name`": `"Iceberg`", `
    `t`t`"foreground`": `"#c6c8d1`", `
    `t`t`"background`": `"#161821`", `
    `t`t`"black`": `"#161821`", `
    `t`t`"red`": `"#e27878`", `
    `t`t`"green`": `"#b4be82`", `
    `t`t`"yellow`": `"#e2a478`", `
    `t`t`"blue`": `"#84a0c6`", `
    `t`t`"purple`": `"#a093c7`", `
    `t`t`"cyan`": `"#89b8c2`", `
    `t`t`"white`": `"#c6c8d1`", `
    `t`t`"brightBlack`": `"#6b7089`", `
    `t`t`"brightRed`": `"#e98989`", `
    `t`t`"brightGreen`": `"#c0ca8e`", `
    `t`t`"brightYellow`": `"#e9b189`", `
    `t`t`"brightBlue`": `"#91acd1`", `
    `t`t`"brightPurple`": `"#ada0d3`", `
    `t`t`"brightCyan`": `"#95c4ce`", `
    `t`t`"brightWhite`": `"#d2d4de`" `
    `t}
    ],"

# Powershell Coreの設定の追加
$data = $data -replace "`"source`": `"Windows.Terminal.PowershellCore`"", `
    "`"source`": `"Windows.Terminal.PowershellCore`", `
    `t`t`t`"cursorShape`": `"filledBox`", `
    `t`t`t`"colorScheme`": `"Iceberg`", `
    `t`t`t`"fontFace`": `"MesloLGS NF`", `
    `t`t`t`"fontSize`": 10, `
    `t`t`t`"useAcrylic`": true, `
    `t`t`t`"acrylicOpacity`": 0.8" 

# settings.jsonの上書き
$data | Out-File "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json" -Encoding default

# oh-my-poshのインストール
pwsh .\setup_oh-my-posh.ps1

# ログファイルの出力停止
Stop-Transcript