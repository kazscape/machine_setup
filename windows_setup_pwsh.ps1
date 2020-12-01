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


# ���O�t�@�C���̏o�͒�~
Stop-Transcript