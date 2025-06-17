`Set-ExecutionPolicy Unrestricted`

# Install Choco
```
  Set-ExecutionPolicy Bypass -Scope Process -Force; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
# Install soft
choco install chocolateygui -fy
choco install autohotkey -fy
choco install googlechrome -fy
choco install googledrive -fy
choco install 7zip.install -fy
choco install notepadplusplus.install -fy
choco install keepass -fy
choco install telegram -fy

choco install spotify -fy
choco install vlc -fy
choco install git -fy
choco install discord -fy

choco install vscode -fy
choco install jetbrains-rider
choco install visualstudio2022community

# Configure GIT
# Configuring git
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.mylog "log --pretty=format:'%h %s [%an]' --graph"
git config --global alias.l "log --oneline"
git config --global pull.rebase true
git config --global fetch.prune true
git config --global user.name "Bulat G"
git config --global user.email "14952031+bulat-gab@users.noreply.github.com"
git config --global core.editor "code --wait"

# Docker

### Docker powershel auto complete

https://github.com/matt9ucci/DockerCompletion  
`Install-Module DockerCompletion -Scope CurrentUser`  
`Import-Module DockerCompletion`  
`PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force` - Install Git Autocomplete  
`Add-PoshGitToProfile -AllHosts` - Add to terminal  

# Profile setup

`Test-Path $PROFILE` - test profile existence  
`New-Item -Path $PROFILE -ItemType File -Force` - create empty profile

# RDP connection

`runas /u:MicrosoftAccount\username@example.com winver` -- run this command if RDP connection fails with **Login Failed**  
