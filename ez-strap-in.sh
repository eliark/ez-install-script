#!/bin/bash

# WARNING! this script is for after the disk you want arch installed on is
# mounted to /mnt and ready to be writen to. (assumes you are loged in as root) 
# and you must be in the folder that you are running it from. because it
# depends on other sctipts to finnish (needs install-me, .zshrc, .bashrc, arch1, and install-help)

mount -o remount,size=1G /run/archiso/cowspace
pacstrap /mnt base base-devel
genfstab -U -p /mnt > /mnt/etc/fstab && cat /mnt/etc/fstab


cp /home/liveuser/Desktop/ez-install-script/arrow1.sh /mnt
cp /home/liveuser/Desktop/ez-install-script/install-yaourt.sh /mnt/root
cp /home/liveuser/Desktop/ez-install-script/ez-install.sh /mnt/root

cp -R /home/liveuser/Desktop/ez-install-script /mnt/root

cp /home/liveuser/Desktop/ez-install-script/.face.icon /mnt/root
cp /home/liveuser/Desktop/ez-install-script/.face /mnt/root
cp /home/liveuser/Desktop/ez-install-script/arrow1.sh /mnt/root

cp /home/liveuser/.zshrc /mnt/root
cp /home/liveuser/.bashrc /mnt/root

cp -R /home/liveuser/.config /mnt/root
cp -R /home/liveuser/.fonts /mnt/root
cp -R /home/liveuser/.conky /mnt/root
cp -R /home/liveuser/.icons /mnt/root
cp -R /home/liveuser/.local /mnt/root
cp -R /home/liveuser/.themes /mnt/root

cp -R /home/liveuser/Desktop /mnt/root
cp -R /home/liveuser/Pictures /mnt/root
cp -R /home/liveuser/icons /mnt/root




echo "##################################################################"
echo ""
echo "now copy and paste or enter this next line "
echo ""
echo "./ez-install.sh"
echo ""
echo ""
zenity --width=250 --info --text "The base system is installed. Now run 
     sudo ./ez-install.sh"
# Configuring the system
arch-chroot /mnt /bin/bash
