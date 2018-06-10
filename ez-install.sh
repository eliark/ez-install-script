#!/bin/bash
#
# Replace "eli" with the name of your choice.
# usernames must be all lower case letters.
USERNM=eli
#
# Replace "ARROW" with the computer name of your choice.
HOSTNM=ARROW
#
# Replace "sda" with your drive letters. run lsblk to find your drive
# DO NOT put partition numbers here eg; (sda1) it will fail if you do.
# only the 3 letters sda, sdb, sdc, sdd, like that.
HARDDRV=sda
#
# Replace "es" with your keybord layout.
# since you are reading this in english I assume you want  <us> 
KEYBD=es

#el=$(zenity --entry --text "please enter your user name?" --entry-text "eli")
#ar=$(zenity --entry --text "please enter the host/computers name?" --entry-text "ARROW")
#zenity --width=250 --info --text "We will now install everythig for you.
#The only thing left is the passwords.
#But that will come at the end of the install.
#We will tell you when we are ready for that.
#For now, relax and have a drink."

# Create the locale
#
# Remove the "#" in front of the locale(s) you want
## nano /etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'en_US ISO-8859-1' >> /etc/locale.gen

locale-gen

# locale.conf
echo LANG=en_US.UTF-8 >> /etc/locale.conf
export LANG=en_US.UTF-8

echo "setting hostname as $HOSTNM"
echo $HOSTNM> /etc/hostname

#install bootloader for UEFI un coment
##############################################################################################

#pacman -S grub-efi-x86_64
#mkdir -p /boot/efi
#mount -t vfat /dev/sda1 /boot/efi

#modprobe dm-mod
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --boot-directory=/boot/efi/EFI --recheck --debug
#mkdir -p /boot/efi/EFI/grub/locale
#cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/efi/EFI/grub/locale/en.mo
#grub-mkconfig -o /boot/efi/EFI/grub/grub.cfg

# Install the bootloader
# The mount command will result in an error because it is already loaded.

#mount -t efivarfs efivarfs /sys/firmware/efi/efivars
#pacman -S gummiboot
#gummiboot install

# Copy configuration file to add an entry for Arch Linux to the gummiboot manager
#cp arch.conf /boot/loader/entries/

# Make sure we have a network connection after we reboot
#systemctl enable dhcpcd.service

## end of UEFI script. DO NOT edit anything below this line.
####################################################################################

echo 'KEYMAP=$KEYBD' > /etc/vconsole.conf

pacman -Sy --noconfirm grsync gufw asunder lame terminator gnome-disk-utility grub-bios linux-headers linux-lts linux-lts-headers gvfs gvfs-afc thunar thunar-volman xdg-user-dirs-gtk zsh zsh-completions zsh-syntax-highlighting sshfs sudo b43-fwcutter btrfs-progs clonezilla crda darkhttpd ddrescue dhclient dialog dmraid dnsmasq dnsutils dosfstools elinks ethtool exfat-utils f2fs-tools fsarchiver gnu-netcat gpm mc grml-zsh-config grub hdparm ipw2100-fw ipw2200-fw irssi lftp lsscsi mtools ndisc6 nfs-utils nilfs-utils nmap ntfs-3g ntp openconnect openssh openvpn partclone partimage ppp pptpclient refind-efi rp-pppoe sdparm sg3_utils smartmontools tcpdump testdisk usb_modeswitch vim-minimal vpnc wget wireless_tools wpa_actiond wvdial xl2tpd zd1211-firmware boost dmidecode gptfdisk hwinfo kconfig kcoreaddons kdebase-runtime ki18n kparts kpmcore parted polkit-qt5 python qt5-svg qt5-webengine qt5ct rsync solid squashfs-tools yaml-cpp extra-cmake-modules git qt5-tools qt5-styleplugins xorg-server xorg-xinit xorg-twm virtualbox-guest-modules-arch virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-dkms virtualbox-guest-iso alsa-utils mesa intel-ucode xf86-video-intel xf86-video-vesa xf86-video-amdgpu xf86-video-nouveau base-devel wpa_supplicant gnome-keyring firefox chromium networkmanager network-manager-applet xfce4 xfce4-goodies zenity conky conky-manager catfish mousepad os-prober gparted accountsservice lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings mate-system-monitor guake xterm gnome-terminal gnome-2048 gbrainy kmahjongg gnome-mahjongg meld groovy deepin-clone gedit-plugins cmake bluefish atom reflector nemo atril leafpad pluma xdg-user-dirs bash-completion ncdu file-roller parcellite unrar p7zip mlocate htop screenfetch  libreoffice-fresh xpdf fltk emacs giggle ghex geany gimp hexchat telegram-desktop vlc putty transmission-gtk transmission-remote-gtk filezilla uget kdenlive audacity breeze-icons gnome-icon-theme human-icon-theme oxygen-icons hicolor-icon-theme tangerine-icon-theme papirus-icon-theme mate-icon-theme-faenza mate-icon-theme lxde-icon-theme gnome-icon-theme-symbolic gnome-icon-theme-extras elementary-icon-theme deepin-icon-theme arc-icon-theme numix-gtk-theme faenza-icon-theme adwaita-icon-theme wipe boost-libs
 
systemctl start NetworkManager
systemctl enable NetworkManager

# For virtualbox install
pacman -Sy --noconfirm virtualbox-guest-modules-arch virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-iso

#######################################
# For KDE uncomment the next line
#pacman -S --noconfirm plasma kde-applications kde-applications-meta kde-cli-tools openbox

## for the SDDM display manager uncomment the next two lines
#pacman -S --noconfirm sddm sddm-kcm
#systemctl enable sddm 
#######################################
## For XFCE4 uncomment the next line
#pacman -S --noconfirm xfce4 xfce4-goodies openbox

## for lightDM uncomment the next two lines
#pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
#systemctl enable lightdm
########################################
## For Cinnamon  uncomment the next line
#pacman -S --noconfirm cinnamon openbox

## for Gnome Display Manager uncomment the next two lines
#pacman -S --noconfirm gdm
#systemctl enable gdm
########################################


ln -s /usr/share/zoneinfo/America/Mexico_City /etc/locatime

hwclock --systohc --utc

timedatectl set-timezone America/Mexico_City

systemctl enable sshd.service

grub-install --target=i386-pc --recheck /dev/$HARDDRV

grub-mkconfig -o /boot/grub/grub.cfg

#cp arch1 /mnt/home/eli && cp arch-fresh-install.txt /mnt/home/eli

# Set root password
echo "set root password"
passwd

# Create a user (edit the first line)
useradd -m -g users -G wheel,storage,power -s /bin/bash $USERNM

# Create a password for user
echo "set password for $USERNM"
echo""
passwd $USERNM

# Add user to the sudoers group
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
cp /root/.zshrc /home/$USERNM
cp /root/.bashrc /home/$USERNM
cp /root/arrow1.sh /home/$USERNM
cp -R /root/icons /home/$USERNM
cp /root/install-yaourt.sh /home/$USERNM
cp /root/.face.icon /home/$USERNM
cp /root/.face /home/$USERNM
cp -R /root/ez-install-script /home/$USERNM
cp -R /root/.conf /home/$USERNM
cp -R /root/.font /home/$USERNM
cp -R /root/.conky /home/$USERNM
cp -R /root/.icons /home/$USERNM
cp -R /root/.locale /home/$USERNM
cp -R /root/.themes /home/$USERNM

# give scripts exicution permitions
cd /home/$USERNM/
chmod +x install-yaourt.sh arrow1.sh
cd ez-install-script
chmod +x install-yaourt.sh arrow1.sh 
cd ..

# ensure no permssion issues.
chown -R $USERNM /home/$USRENM

echo ""
echo "##################################################################"
echo ""
echo "finnished. now just run    ./install-yaourt.sh     but NOT as root"
echo "So, that means copy and paste the next line"
echo "umout -R"
echo ""
echo "and then reboot"
echo ""
#zenity --width=200 --info --text="the instalation is finished.
#now run ./install.yaourt.sh"

exit
#umount -R /mnt
#reboot
