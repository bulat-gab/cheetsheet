#!/bin/sh

$GITHUB_EMAIL="14952031+bulat-gab@users.noreply.github.com"
$GITHUB_USER="Bulat G"

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
git config --global user.name $GITHUB_USER
git config --global user.email $GITHUB_EMAIL
git config --global core.editor "code --wait"

eval `ssh-agent -s` 
ssh-keygen -t ed25519  -C $GITHUB_EMAIL  -f ~/.ssh/github_rsa
ssh-add ~/.ssh/github_rsa

echo  'alias gs="git status"' >> ~/.bashrc 

# Configuring docker
## Run docker without 'sudo'
sudo groupadd docker # create a docker group
sudo usermod -aG docker $USER # add current USER to docker group
newgrp docker # apply changes


sudo apt update
sudo apt upgrade -y

sudo apt install wget -y


# install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo snap install --classic code


# 
echo ""
CHROME_VERSION=$(google-chrome --version | grep -oP '(?<=Google Chrome\s)[\d.]+')
echo "Chromium/Chrome version: $CHROME_VERSION"