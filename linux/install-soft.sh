#!/bin/sh

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
