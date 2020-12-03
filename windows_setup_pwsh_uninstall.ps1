# ���[�U�t�H���_�p�X�̎擾
$userprofile = $env:USERPROFILE

# �v���t�@�C���uMicrosoft.PowerShell_profile.ps1�v�̍폜
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

# oh-my-posh���W���[���̃C���X�g�[��
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Modules/oh-my-posh

# posh-git���W���[���̍폜
Remove-Item -Force -Recurse  ${userprofile}\Documents\PowerShell\Modules/posh-git

# Windows Terminal��settings.json�̍폜
if(Test-Path "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json") {
    Remove-Item "$userprofile\AppData\Local\Microsoft\Windows Terminal\settings.json" -Force
}

# Winmerge�̃A���C���X�g�[��
scoop uninstall winmerge

# Windows Terminal�̃A���C���X�g�[��
scoop uninstall windows-terminal

# Powershell Core�̃A���C���X�g�[��
scoop uninstall pwsh

# Slack�̃A���C���X�g�[��
scoop uninstall slack

# Google Chrome�̃A���C���X�g�[��
scoop uninstall googlechrome

# Visual Studio Code�̃R���e�L�X�g���j���[����̍폜
Start-Process -FilePath "reg" -ArgumentList "import ${userprofile}\scoop\apps\vscode\current\vscode-uninstall-context.reg"

# Visual Studio Code�̃A���C���X�g�[��
scoop uninstall vscode

# 7zip�̃A���C���X�g�[��
scoop uninstall 7zip

# extras bucket���A���C���X�g�[��
scoop bucket rm extras

# git�̃A���C���X�g�[��
scoop uninstall git

# scoop�̃A���C���X�g�[��
scoop uninstall scoop
