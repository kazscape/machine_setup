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

# �L���b�V���̃N���A
scoop cache rm *

# ���O�t�@�C���̏o�͒�~
Stop-Transcript