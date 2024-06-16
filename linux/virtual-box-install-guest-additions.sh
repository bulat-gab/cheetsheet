#!/bin/sh

# Installing Virtual Box Guest Additions
# (Allows Drag&Drop, Shared Clipboard)


sudo dpkg -l | grep -E "dkms|linux-headers-$(uname -r)|build-essential"
sudo apt update -y
sudo apt upgrade
sudo apt install -y dkms linux-headers-$(uname -r) gcc make perl

# Reboot if needed
[ -f /var/run/reboot-required ] && sudo systemctl reboot

# After reboot
sudo apt-cache policy virtualbox-guest-additions-iso
sudo apt install -y virtualbox-guest-additions-iso
sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /media/
sudo /media/VBoxLinuxAdditions.run

# Reboot again
sudo systemctl reboot -i

# Activate Drag&Drop, Shared Clipboard in VirtualBox UI