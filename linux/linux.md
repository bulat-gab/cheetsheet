`sudo chown -R $USER:$USER ~/.config/Code` - allow writing configs into home directory  
`sudo apt-get install network-manager-openvpn-gnome` - open vpn  
`timedatectl set-local-rtc 1 --adjust-system-clock` - store time as local (for windows-linux dual boot time fix)

## Useful links

[Google Drive for Ubuntu](https://linuxconfig.org/google-drive-on-ubuntu-18-04-bionic-beaver-linux)

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

## Increase disk size (when disk in use)

After increasing disk size in VM Ware you need to resize the disk in guest OS  
`lsblk` - verify the new size  
Example output:

```
sda      8:0    0   100G  0 disk
├─sda1   8:1    0     1M  0 part
└─sda2   8:2    0    50G  0 part /var/snap/firefox/common/host-hunspell
```

sda has 100G size, but only 50G used.  
`sudo parted /dev/sda` - enter parted tool  
`print` - to see partitions
`resizepart 2 100GB` - resize  
`sudo reboot` - to apply changes  
`sudo resize2fs /dev/sda2` - resize file system to match the partition
