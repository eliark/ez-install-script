USERNAME=eli
HOSTNAME=ARROW
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
echo "setting hostname as $HOSTNAME"
echo $HOSTNAME> /etc/hostname

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
#pacman -Sy --noconfirm virtualbox-guest-modules-arch virtualbox-host-modules-arch virtualbox-guest-utils virtualbox-guest-iso

# For KDE
#pacman -S --noconfirm plasma kde-applications kde-applications-meta kde-cli-tools sddm
#systemctl enable sddm 

# For XFCE4
#pacman -S --noconfirm xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
#systemctl enable lightdm

# For Cinnamon
pacman -S --noconfirm cinnamon gdm
systemctl enable gdm



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
useradd -m -g users -G wheel,storage,power -s /bin/bash $USERNAME

# Create a password for user
echo "set password for $USERNAME"
passwd $USERNAME

# Add user to the sudoers group
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
cp /root/.zshrc /home/$USERNAME
cp /root/.bashrc /home/$USERNAME
cp /root/arch1 /home/$USERNAME
cp -R /root/icons /home/$USERNAME
cp /root/install-yaourt.sh /home/$USERNAME
cp /root/.face.icon /home/$USERNAME
cp /root/.face /home/$USERNAME
cp -R /root/install-script /home/$USERNAME

echo ""
echo "##################################################################"
echo ""
echo "finnished. now just run    ./install-yaourt.sh     but NOT as root"

# Exit out of the chroot, unmount and reboot
exit
#umount -R /mnt
#reboot
