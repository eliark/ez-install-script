#!/bin/bash

# Setting variables
title="Yaourt and Pamac Installer"

zenity --question --height=50 --width=200 --title="$title" --text "Welcome to the\nYaourt and Pamac Installer.\nIn the terminal you will need to\nenter your password,\nand answer two\nyes or no questions.\n\nClick 'yes' to begin or 'no' to exit."

if [ "$?" = "1" ]
	then zenity --width=200 --info --text="Yaourt and Pamac have not been installed.\n\nThis installer will now close." && exit
fi
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

zenity --question --height=50 --width=200 --timeout=60 --title="$title" --text "yaourt installation is Finnished!\nNext we will install\npamac a graphical package installer.\n\nClick 'yes' to begin or 'no' to skip."

if [ "$?" = "1" ]
	then zenity --width=200 --info --text="pamac has not been installed.\n\nplease re-login." && exit
fi

yaourt -S --noconfirm pamac-aur pamac-tray-appindicator

zenity --width=200 --info --text="pamac is installed.
please re-login."



