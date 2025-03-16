#!/bin/sh

GITHUB_EMAIL="14952031+bulat-gab@users.noreply.github.com"
GITHUB_USER="Bulat G"

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

function install_google_chrome() {
    if command -v google-chrome > /dev/null; then
        echo "Google Chrome is already installed."
        return

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
}

function install_node() {
    if command -v node > /dev/null; then
        echo "Node.js is already installed."
        return

    curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    sudo apt-get install -y nodejs || true
    sudo apt install npm -y
    sudo npm install pm2@latest -g
}

function install_docker() {
    if command -v docker > /dev/null; then
        echo "Docker is already installed."
        return

    # Source: https://docs.docker.com/engine/install/ubuntu/

    # Add Docker's official GPG key:
    # sudo apt-get update -y # Skip update as it's already done as part of this script
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y

    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo docker run hello-world

    # Configuring Run docker without 'sudo'
    sudo groupadd docker # create a docker group
    sudo usermod -aG docker $USER # add current USER to docker group
    newgrp docker # apply changes
}

function delete_ghostcript() {
    # Ghostscript's alias gs is conflicting with my git status alias
    # I do not use Ghostscript, so I am removing it

    # Check if Ghostscript is installed
    if command -v gs &> /dev/null; then
        echo "Ghostscript is installed. Removing..."
        
        # Uninstall Ghostscript
        sudo apt remove --purge ghostscript -y
        
        # Remove unnecessary dependencies
        sudo apt autoremove -y
        
        echo "Ghostscript has been removed successfully."
    else
        echo "Ghostscript is NOT installed."
    fi
}

function install_soft() {
    sudo snap install --classic code
    sudo snap install rider --classic

    sudo apt install -y lf tmux htop
}

function setup() {
    sudo apt update
    sudo apt upgrade -y

    sudo apt install -y wget curl git
    sudo apt install -y python3 python3-pip libzbar0 unzip python3-venv || true
    sudo systemctl daemon-reload

    install_google_chrome
    install_node
    install_docker

    delete_ghostcript

    install_soft

    echo ""
    echo "Setup has been completed."
    echo "Google Chrome version: $(google-chrome --version | grep -oP '(?<=Google Chrome\s)[\d.]+')"
    # echo "Chrome driver version: $(chromedriver --version | grep -oP '(?<=ChromeDriver\s)[\d.]+')"
    echo "PM2 version: $(pm2 --version)"
    echo "Node.js version: $(node --version 2>/dev/null || echo 'Node.js not found')"
    echo "npm version: $(npm --version 2>/dev/null || echo 'npm not found')"
    echo "docker version: $(docker --version 2>/dev/null || echo 'docker not found')"
    echo "git username: $(git config --global user.name)"
    echo "git email: $(git config --global user.email)"
    echo ""
}