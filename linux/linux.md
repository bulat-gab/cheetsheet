`sudo chown -R $USER:$USER ~/.config/Code` - allow writing configs into home directory  
`sudo apt-get install network-manager-openvpn-gnome` - open vpn  
`timedatectl set-local-rtc 1 --adjust-system-clock` - store time as local (for windows-linux dual boot time fix)

## Useful links

[Google Drive for Ubuntu](https://linuxconfig.org/google-drive-on-ubuntu-18-04-bionic-beaver-linux)

## Configure newly installed Ubuntu

#### [config-ubuntu.sh](./config-ubuntu.sh)

#### [python3.10-ubuntu.sh](./python3.10-ubuntu.sh)

## Install Virtual Box guest additions

#### [virtual-box-install-guest-additions.sh](./virtual-box-install-guest-additions.sh)


# VMware
## Mount shared folder
### To make it persistent

Edit the file: `sudo nano /etc/fstab` and add this line:  
`.host:/    /mnt/hgfs/    fuse.vmhgfs-fuse    defaults,allow_other,uid=1000     0    0`

Shared folder location on Guest: `/mnt/hgfs/{Folder_Name}`

Mount: `sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000`

If the `hgfs` directory doesn't exist, try:  
`sudo vmhgfs-fuse .host:/ /mnt/ -o allow_other -o uid=1000`
