#!/bin/bash


el=$(zenity --entry --text "please enter your user name?" --entry-text "eli")
ar=$(zenity --entry --text "please enter the host/computers name?" --entry-text "ARROW")
zenity --width=250 --info --text "We will now install everythig for you.
The only thing left is the passwords.
But that will come at the end of the install.
We will tell you when we are ready for that.
For now, relax and have a drink."

# Create locale file
# Remove the "#" in front of the locale(s) you need, en_US.UTF-8 in my case
## nano /etc/locale.gen
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo e'n_US ISO-8859-1' >> /etc/locale.gen

# Save the file and generate the locales
locale-gen

# locale.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Set up the hostname (edit 2nd line to customize)
echo "setting hostname as $ar"
echo $ar> /etc/hostname

#install bootloader

#pacman -S grub-efi-x86_64
#mkdir -p /boot/efi
#mount -t vfat /dev/sda1 /boot/efi

#modprobe dm-mod
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --boot-directory=/boot/efi/EFI --recheck --debug
#mkdir -p /boot/efi/EFI/grub/locale
#cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/efi/EFI/grub/locale/en.mo
#grub-mkconfig -o /boot/efi/EFI/grub/grub.cfg

# Install the bootloader
# The mount command will most likely result in an error due to it being loaded already

#mount -t efivarfs efivarfs /sys/firmware/efi/efivars
#pacman -S gummiboot
#gummiboot install

# Copy configuration file to add an entry for Arch Linux to the gummiboot manager
#cp arch.conf /boot/loader/entries/

# Make sure we have a network connection after we reboot
#systemctl enable dhcpcd.service



echo 'KEYMAP=es' > /etc/vconsole.conf

pacman -Sy --noconfirm grsync gufw asunder lame terminator geany chromium firefox gparted gnome-disk-utility vlc nemo gnome-terminal guake dialog grub-bios linux-headers linux-lts linux-lts-headers wpa_supplicant wireless_tools htop screenfetch openssh gvfs gvfs-afc thunar-volman xdg-user-dirs xdg-user-dirs-gtk xorg-server xorg-xinit xorg-twm xf86-video-intel xf86-video-vesa networkmanager network-manager-applet deepin-clone zsh zsh-completions zsh-syntax-highlighting libreoffice-fresh xpdf atril vlc telegram-desktop gimp sshfs uget audacity cmake meld intel-ucode extra-cmake-modules kdebase-runtime rsync sudo 
 
systemctl start NetworkManager
systemctl enable NetworkManager

# For virtualbox install
pacman -Sy --noconfirm virtualbox-guest-modules-arch virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-iso

# For KDE uncomment the next line
#pacman -S --noconfirm plasma kde-applications kde-applications-meta kde-cli-tools openbox

## for the SDDM display manager uncomment the next two lines
#pacman -S --noconfirm sddm sddm-kcm
#systemctl enable sddm 

# For XFCE4 uncomment the next line
pacman -S --noconfirm xfce4 xfce4-goodies openbox

## for lightDM uncomment the next two lines
pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm

# For Cinnamon  uncomment the next line
#pacman -S --noconfirm cinnamon openbox

## for Gnome Display Manager uncomment the next two lines
#pacman -S --noconfirm gdm
#systemctl enable gdm



ln -s /usr/share/zoneinfo/America/Mexico_City /etc/locatime

hwclock --systohc --utc

timedatectl set-timezone America/Mexico_City

systemctl enable sshd.service

grub-install --target=i386-pc --recheck /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

#cp arch1 /mnt/home/eli && cp arch-fresh-install.txt /mnt/home/eli

# Set root password
echo "set root password"
passwd

# Create a user (edit the first line)
useradd -m -g users -G wheel,storage,power -s /bin/bash $el

# Create a password for user
echo "set password for $el"
passwd $el

# Add user to the sudoers group
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
cp /root/.zshrc /home/$el
cp /root/.bashrc /home/$el
cp /root/arch1 /home/$el
cp -R /root/icons /home/$el
cp /root/install-yaourt.sh /home/$el
cp /root/.face.icon /home/$el
cp /root/.face /home/$el
cp -R /root/install-script /home/$el

echo ""
echo "##################################################################"
echo ""
echo "finnished. now just run    ./install-yaourt.sh     but NOT as root"
zenity --width=150 --info --text="the instalation is finishe.
now run install.yaourt.sh"
# Exit out of the chroot, unmount and reboot
exit
#umount -R /mnt
#reboot

