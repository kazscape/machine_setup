# ���[�U�t�H���_�p�X�̎擾
$userprofile = $env:USERPROFILE

# ���O�t�@�C���̏o�͊J�n
Start-Transcript "./windows_setup_pwsh_log.txt"

# ���s�|���V�[�̎擾
Get-ExecutionPolicy -List

# ���s�|���V�[�̕ύX
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force

# ���s�|���V�[�̎擾
Get-ExecutionPolicy -List

# scoop�̃C���X�g�[��
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# git�̃C���X�g�[��
scoop install git

# extras bucket��ǉ�
scoop bucket add extras

# Visual Studio Code�̃C���X�g�[��
scoop install vscode
Start-Process -FilePath "reg" -ArgumentList "import ${userprofile}\scoop\apps\vscode\current\vscode-install-context.reg"

# Google Chrome�̃C���X�g�[��
scoop install googlechrome

# Slack�̃C���X�g�[��
scoop install slack

# Powershell core�̃C���X�g�[��
scoop install pwsh

# Windows Terminal�̃C���X�g�[��
scoop install windows-terminal

# Winmerge�̃C���X�g�[��
scoop install winmerge

# �L���b�V���̃N���A
scoop cache rm *

# MesloLGS NF�t�H���g�̃_�E�����[�h
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"  -Outfile ".\MesloLGS NF Regular.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"  -Outfile ".\MesloLGS NF Bold.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"  -Outfile ".\MesloLGS NF Italic.ttf"
Invoke-WebRequest -Uri "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"  -Outfile ".\MesloLGS NF Bold Italic.ttf"

# �t�H���g�̃C���X�g�[��
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
dir .\*.ttf | %{ $fonts.CopyHere($_.fullname) }

# �t�@�C���̍폜
Remove-Item .\*.ttf

# settings.json�쐬�̂��߂�Windows Terminal�̋N��
Start-Process -FilePath "wt.exe"

# Windows Terminal�̏I��
Start-Sleep -Seconds 2
$pro = Get-Process WindowsTerminal
if ( $pro -ne $null ) {
    Stop-Process -Name WindowsTerminal
}

# Windows Terminal��settings.json�̎擾
$data = Get-Content -Encoding Ascii "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json"

# Iceberg�J���[�X�L�[�}�̒ǉ�
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

# Powershell Core�̐ݒ�̒ǉ�
$data = $data -replace "`"source`": `"Windows.Terminal.PowershellCore`"", `
    "`"source`": `"Windows.Terminal.PowershellCore`", `
    `t`t`t`"cursorShape`": `"filledBox`", `
    `t`t`t`"colorScheme`": `"Iceberg`", `
    `t`t`t`"fontFace`": `"MesloLGS NF`", `
    `t`t`t`"fontSize`": 10, `
    `t`t`t`"useAcrylic`": true, `
    `t`t`t`"acrylicOpacity`": 0.8" 

# settings.json�̏㏑��
$data | Out-File "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json" -Encoding default

# ���O�t�@�C���̏o�͒�~
Stop-Transcript