#!/bin/bash


# Install Yaourt and Pamac using AUR
cd ~
sudo pacman -S --needed --noconfirm base-devel git wget yajl zenity

git clone https://aur.archlinux.org/package-query.git

cd package-query/ && makepkg -si

cd ..

git clone https://aur.archlinux.org/yaourt.git

cd yaourt/ && makepkg -si

cd ..

sudo rm -dR yaourt/ package-query/

zenity --width=200 --info --text="yaourt install is DONE.
Next we will install pamac
a graphical package installer"

yaourt -S --noconfirm pamac-aur pamac-tray-appindicator

zenity --width=200 --info --text="pamac is installed.
please re-login."
