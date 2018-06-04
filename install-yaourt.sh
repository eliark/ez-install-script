#!/bin/bash


# 2. Install Yaourt using AUR
cd ~
sudo pacman -S --needed base-devel git wget yajl


# Just ENTER to select default selection:
# After installing necessary dependencies, we have to install package-query
# that allows to build and run Yaourt.
# To do so, GIT clone to package-query repository as shown below:

git clone https://aur.archlinux.org/package-query.git


# Then, go to the package-query directory and compile and install it
# as shown below.

cd package-query/ && makepkg -si


# Package-query has been installed.
# Now, exit from the package-query directory using command:

cd ..


# Git clone to the latest Yaourt repository :

git clone https://aur.archlinux.org/yaourt.git


# Then, go to the Yaourt directory and compile and install it as shown below.

cd yaourt/ && makepkg -si


# That’s it. Yaourt has been installed. You can install aurvote to vote for favorite packages from AUR.

# Finally, exit from the Yaourt repository and delete both cloned repositories using commands:


cd ..

sudo rm -dR yaourt/ package-query/

# Yaourt usage is mostly the same as pacman.
# you are done with the yaourt install
#
# you might want to install pamac. a GUI package manager

yaourt -S pamac-aur pamac-tray-appindicator

echo "now logout and log back in. You are Done!"
