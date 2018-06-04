#!/bin/bash

# WARNING! this script is for after the disk you want arch installed on is
# mounted to /mnt and ready to be writen to. (assumes you are loged in as root) 
# and you must be in the folder that you are running it from. because it
# depends on other sctipts to finnish (needs install-me, .zshrc, .bashrc, arch1, and install-help)

mount -o remount,size=1G /run/archiso/cowspace
pacstrap /mnt base base-devel
genfstab -U -p /mnt > /mnt/etc/fstab && cat /mnt/etc/fstab
cp /home/liveuser/Desktop/ez-install-script/arch1 /mnt
#cp install-me /mnt
cp .zshrc /mnt/root
cp .bashrc /mnt/root
#cp -R install-help /mnt
cp /home/liveuser/Desktop/ez-install-script/install-yaourt.sh /mnt/root
cp /home/liveuser/Desktop/ez-install-script/ez-install.sh /mnt/root
cp -R /home/liveuser/Desktop/ez-install-script/icons /mnt/root
cp -R /home/liveuser/Desktop/ez-install-script/install-script /mnt/root
cp /home/liveuser/Desktop/ez-install-script/.face.icon /mnt/root
cp /home/liveuser/Desktop/ez-install-script/.face /mnt/root
cp /home/liveuser/Desktop/ez-install-script/arch1 /mnt/root
cp /home/liveuser/Desktop/ez-install-script/.zshrc /mnt/root
cp /home/liveuser/Desktop/ez-install-script/.bashrc /mnt/root

# depends on .zshrc and .bashrc
# they must be in the same folder as this script

echo "##################################################################"
echo ""
echo "now copy and paste or enter this next line "
echo ""
echo "./ez-install.sh"
echo ""
echo ""

# Configuring the system
arch-chroot /mnt /bin/bash
