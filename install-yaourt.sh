#!/bin/bash


# 2. Install Yaourt using AUR
cd ~
sudo pacman -S --needed --noconfirm base-devel git wget yajl zenity

git clone https://aur.archlinux.org/package-query.git

cd package-query/ && makepkg -si

cd ..

git clone https://aur.archlinux.org/yaourt.git

cd yaourt/ && makepkg -si

cd ..

sudo rm -dR yaourt/ package-query/

zenity --info --text="yaourt install is DONE.
Next we will install pamac
a graohical package installer"
yaourt -S pamac-aur pamac-tray-appindicator
echo "Run,  yaourt -S pamac-aur pamac-tray-appindicator"
echo ""
echo "then logout and log back in. You are Done!"
zenity --info --text="pamac is installed. please reboo the computer."