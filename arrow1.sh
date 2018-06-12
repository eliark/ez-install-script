#!/bin/bash

#-----------------------------------------------------------------------
# Created by ELIAS WALKER 
#-----------------------------------------------------------------------
# started 24/Jul/2017 undergoing development to date. 
#-----------------------------------------------------------------------
# Copyright 2018 eli <eli@hp>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#
########################################################################
########################################################################
#### Run this script after your first boot with archlinux (as root) ####
########################################################################
########################################################################

# checks for root. because it will not work unless it has root access.
# If no root is found it will log you in as root. Read comments bellow.
#-----------------------------------------------------------------------
if [[ $USER = "root"  ]]
 then
        clear 
        clear
        echo " ROOT check passed "
#       ==========================================================
#       the next few lines of code are only if you dont use sudo
#       when opening this script.
#
#       please make sure to run this with (sudo ./arch6-2.sh)
# 
#       it will work fine if you do not. but as stated above and
#       bellow, if it is ran as normal user the script will
#       automaticly log you in as root (password needed) BUT!
#       in order to exit the script you need to drop out of root
#       by typing Q then enter. then exit the script by typing Q
#       and enter again. its just easier if you run it with
#       sudo to begin with.
#       ==========================================================  
    else
         clear
         clear
       echo " ROOT check FAILED (must be logged in as ROOT) "
       echo ""
       echo " ============================================= "
	     echo " ATTENTION! you will need to hit Q & enter two "
 	     echo " times to exit this script                     "
	     echo " ============================================= "
       echo " ============================================= "
       echo " to avoid this bug. next time run with         "
	     echo " sudo ./arch6-2.sh                             "
       echo " ============================================= "
#   	  exit 
	    sudo ./arch1 
fi

#-----------------------------------------------------------------
# home menu
while true
do
  echo ""
  echo " ================================================ "
  echo " ======= ARCH install script Home menu ========== "
  echo " = BE ADVISED! enter ALL commands in lower case = "
  echo " ================================================ "
  echo " (A)_basic options_______________________enter_a: "
  echo " (B)_swapfile options____________________enter_b: "
  echo " (C)_graphics drivers and xorg___________enter_c: "
  echo " (D)_display managers____________________enter_d: "
  echo " (E)_desktop enviroments_________________enter_e: "
  echo " (F)_system settings options_____________enter_f: "
  echo " (G)_N/A this option goes nowhere________enter_g: "
  echo ""
  echo " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- "
  echo " screenfetch_____________________________enter_sf "
  echo " htop____________________________________enter_ht "
  echo " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- "
  echo " (Q)_to exit this menu___________________enter_q: "  
  echo " (MM)_back to Home menu/main menu________enter_mm "
  echo " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- "
  echo " (R)_to_restart_the computer_____________enter_r: "
  echo " (X)_to turn off the computer____________enter-x: "
  echo ""
getDate(){
	date
	
	return
}

getDate
  echo -e "\n"
  echo -e "enter your selection \c"
  read answer
  case "$answer" in
  
########################################################################
#################### start of install script ###########################
########################################################################
  a)
      clear
      clear
      echo " ========================= (A) basic options ============================ "
      echo ""
      echo " (1)__conect to wifi____________________________________________enter__1: "
      echo " (2)__setup mirrorlist__________________________________________enter__2: "
      echo " (3)__check and run update______________________________________enter__3: "
      echo " (4)__install console apps(FOR NO DISPLAY ENVIRONMENT)__________enter__4: "
      echo " (5)__install desktop apps (TO WORK WITH A DISPLAY ENVIRONMENT)_enter__5: "
      echo " (6)__make (eli) a super user___________________________________enter__6: "
      echo " (7)__manually make user superuser______________________________enter__7: "
      echo " (8)__install network manager___________________________________enter__8: "
      echo " (9)__update the bootloader (grub)______________________________enter__9: "
      echo " (10)_set locale to english US__________________________________enter_10: "
      echo " (11)_list disks and partitions_________________________________enter_11: "
      echo " (12)_list disks UUIDs and partitions___________________________enter_12: " ;;



#-----------------------------------------------------------------------
# connect to wifi... ( assumes "dialog" is installed )
  1)  wifi-menu
       clear 
       clear ;;

#-----------------------------------------------------------------------
# setup morrorlist. installs reflector first. if already installed
# pacman skips the install and the code continues.
  2)  pacman -Sy reflector
      reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist
       clear 
       clear ;;
       
#-----------------------------------------------------------------------
# force update and install latest packages (assumes AUR is activated)
  3) pacman -Syyu 
     yaourt -Syu
     clear 
     clear ;;
     
#-----------------------------------------------------------------------
# install nedded console apps
  4)   cd ~
       pacman -S dialog grub-bios linux-headers linux-lts linux-lts-headers wpa_supplicant wireless_tools htop screenfetch openssh gvfs gvfs-afc thunar-volman xdg-user-dirs xdg-user-dirs-gtk
       clear 
       clear ;;
#-----------------------------------------------------------------------
# install favorite desktop apps
       
  5)   clear
       clear
       cd ~
       pacman -S grsync gufw asunder lame terminator geany chromium firefox gparted gnome-disk-utility vlc nemo gnome-terminal guake dialog grub-bios linux-headers linux-lts linux-lts-headers wpa_supplicant wireless_tools htop screenfetch openssh gvfs gvfs-afc thunar-volman xdg-user-dirs xdg-user-dirs-gtk ;;
     
#----------------------------------------------------------------------
# add USER to wheel/ give root privleges 
# (currently only works with user eli) simply swap eli with your name or
  6)
     clear
     clear
     adduser eli wheel ;;
#-----------------------------------------------------------------------
# edit file manually 
  7)
     clear
     clear
     EDITOR="nano" visudo ;;


#----------------------------------------------------------------------
# install network manager
  8) pacman -S networkmanager network-manager-applet
         systemctl start NetworkManager
         systemctl enable NetworkManager ;;

#-----------------------------------------------------------------------
# update grub
  9)   grub-mkconfig -o /boot/grub/grub.cfg
       clear 
       clear ;;
       
#-----------------------------------------------------------------------
# set locale to english USA
  10) 
     clear
     clear
#     localectl set-locale LANG="en_US.UTF-8"
      ;;

#-----------------------------------------------------------------------
# list disks and partitions and mount points
 11)
   clear
   clear
   lsblk ;;
   
#-----------------------------------------------------------------------
# list UUIDs of all disks and partitions   
 12)
    clear
    clear
    blkid ;;
      
########################################################################
  b) 
      clear
      clear
      echo " ================= (B) swapfile ================== "
      echo " "
      echo " (2G)__create 2GB swapfile______________enter__2g: "
      echo " (4G)__create 4GB swapfile______________enter__4g: "
      echo " (6G)__create 6GB swapfile______________enter__6g: "
      echo " (8G)__create 8GB swapfile______________enter__8g: "
      echo " (16G)_create 16GB swapfile_____________enter_16g: "
      echo " (32G)_create 32GB swapfile_____________enter_32g: "
      echo " (DS)__Delete swapfile__________________enter__ds: "
      echo ""
      echo " (SON)__turn all swap on________________enter__son "  
      echo " (SOFF)_turn all swap off_______________enter_soff "
      echo ""
      echo " -----------------------------------------------   "
      echo " WARNING!!! Only run this next option one time!!   "
      echo " -----------------------------------------------   "
      echo " (SW)_add swapfile to /etc/fstab________enter_sw:  " ;;
      

#-----------------------------------------------------------------------
# add a swapfile
 2G)
     clear
     clear
     fallocate -l 2048M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 2g)   
     clear
     clear
     fallocate -l 2048M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;

 4G)
     clear
     clear
     fallocate -l 4096M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 4g) 
     clear
     clear
     fallocate -l 4096M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;

 6G)
     clear
     clear
     fallocate -l 6144M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 6g)   
     clear
     clear
     fallocate -l 6144M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 8G)
     clear
     clear    
     fallocate -l 8192M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 8g)
     clear
     clear    
     fallocate -l 8192M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile#003AFF#003AFF#E23A72
     swapon /swapfile ;;

 16G)
     clear
     clear    
     fallocate -l 16384M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 16g)
     clear
     clear    
     fallocate -l 16384M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
     
 32G)
     clear
     clear    
     fallocate -l 32768M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;
 32g)
     clear
     clear    
     fallocate -l 32768M /swapfile
     chmod 600 /swapfile
     mkswap /swapfile
     swapon /swapfile ;;

#-----------------------------------------------------------------------
# edit existing swapfiles
 soff) 
      clear
      clear
      swapoff -a
if     [[ error = "true" ]]
 then 
        echo " unable to turn off swap "
 else   
        echo " swap is turned off "
fi ;;
 
 son) 
      clear
      clear
      swapon -a
if     [[ error = "true" ]]
 then   
        echo " unable to turn swap on "
 else   
        echo " swap is turned on "
fi ;;

 ds) 
     clear
     clear
     swapoff -a
     rm -f /swapfile 
if     [[ error = "true" ]]
 then   
        echo " unable to delete swapfile "
 else   
		echo " SwapFile deleted "
fi ;;       
        

#----------------------------------------------------------------------
# add swapfile to fstab
# ONLY RUN ONE TIME!!!
 sw) echo “/swapfile none swap defaults 0 0” >> /etc/fstab
     clear 
     clear ;;



      
########################################################################      
  c)  clear
      clear
      echo " ===========(C) xorg & video drivers =============== "
      echo ""
      echo " (ORG)_install xorg________________________enter_org "
      echo " (INT)_install intel graphics driver_______enter_int "
      echo " (AMD)_install AMD graphics driver_________enter_amd "
      echo " (NVD)_install Nvidia graphics driver______enter_nvd " 
      echo " (VES)_install universal graphics driver___enter_ves " ;;
  
#-----------------------------------------------------------------------
# xorg
 org) pacman -S xorg-server xorg-xinit
      clear
      clear ;;
      
#-----------------------------------------------------------------------     
# intel graphics driver
 int) 
      pacman -S xf86-video-intel
      clear
      clear ;;
      

#-----------------------------------------------------------------------     
# AMD graphics driver
 amd)
      pacman -S xf86-video-amdgpu
      clear
      clear ;;
      
#-----------------------------------------------------------------------     
# Nvidia graphics driver   
 nvd)
      pacman -S xf86-video-nouveau
      clear
      clear ;;


#-----------------------------------------------------------------------     
# vesa universal graphics driver
 ves)
      pacman -S xf86-video-vesa
      clear
      clear ;;


########################################################################
  d)  clear
      clear
      echo " =============(D) display manager ============== "
      echo ""
      echo " (LTDM)_install for MATE/XFCE_________enter_ltdm "
      echo " (SDDM)_install for KDE_______________enter_sddm "
      echo " (LXDM)_install for LXDE______________enter_lxdm "
      echo " (GDM)__install for GNOME/Cinnamon____enter__gdm " ;;




#----------------------------------------------------------------------
# instal and enable lightdm a universal display manager      

  ltdm)
        clear
        clear
        pacman -S lightdm lightdm-gtk-greeter
        systemctl enable lightdm   
        echo " Display manager will start the next time the  "
        echo " computer is restarted. a reboot is needed. " ;;
     
#-----------------------------------------------------------------------
# instal and enable display manager sddm for KDE     
  sddm) pacman -S sddm
        systemctl enable sddm
        clear
        clear
        echo " Display manager will start the next time the computer "
        echo " is restarted. a reboot is needed. " ;;

#-----------------------------------------------------------------------
# instal and enable display manager lxdm for LXDE (also universal) 
  lxdm) pacman -S lxdm
        systemctl enable lxdm
        clear
        clear
        echo " Display manager will start the next time the computer "
        echo " is restarted. a reboot is needed. " ;;

#-----------------------------------------------------------------------
# instal and enable display manager gdm for GNOME and CINNAMON
  gdm) pacman -S gdm
       systemctl enable gdm
       clear
       clear
       echo " Display manager will start the next time the computer "
       echo " is restarted. a reboot is needed. " ;;



########################################################################
  e) 
      clear
      clear
      echo " ==========(E) Desk Top Environment ============= "
      echo " "
      echo " (KDE)___install kde 5 desktop________enter_kde   "
      echo " (MINT)__install Cinnamon desktop_____enter_mint  "
      echo " (GNOME)_install Gnome desktop________enter_gnome "
      echo " (MATE)__install Mate desktop_________enter_mate  "
      echo " (XFCE)__install Xfce4 desktop________enter_xfce  "
      echo " (LXDE)__install LXDE desktop_________enter_lxde  "
      echo " (BOX)___install openbox______________enter_box   "
      echo " (I3)____install i3 desktop___________enter_i3    " ;;




#-----------------------------------------------------------------------
# install KDE desktop
  kde) pacman -S plasma kde-applications
       clear
       clear ;;

#-----------------------------------------------------------------------
# install CINNAMON desktop
  mint) pacman -S cinnamon
        clear
        clear ;;

#-----------------------------------------------------------------------
# install GNOME desktop
  gnome) pacman -S gnome gnome-extra
         clear
         clear ;;

#-----------------------------------------------------------------------
# install MATE desktop
  mate) pacman -S mate mate-extra
  clear
  clear ;;

#-----------------------------------------------------------------------
# install XFCE desktop
  xfce) pacman -S xfce4 xfce4-goodies
  clear
  clear ;;

#-----------------------------------------------------------------------
# install LXDE desktop
  lxde) pacman -S lxde
        clear
        clear ;;

#-----------------------------------------------------------------------
# install OpenBox desktop
  box) pacman -S openbox
        clear
        clear ;;

#-----------------------------------------------------------------------
# install i3 desktop
  i3) pacman -S i3
        clear
        clear ;;
        
########################################################################
 f)
   clear
   clear
   
   echo " ========= (F) system settings options ========== "
   echo ""
   echo " (ES)_set keyboard to spanish___________enter_es: "
   echo " (US)_set keyboard to english___________enter_us: "
#   echo " ===== its located here  /etc/vconsole.conf ===== "
#   echo ""
   echo " (LEN)_set system language to english___enter_le "
#   echo " ====== its located here  /etc/locale.conf ====== "
#   echo ""
   echo " (CSL)_check system language____________enter_sl "
   echo " (CM)__set timezone to central Mexico___enter_cm: "
   echo " (TD)__info about time/date settings____enter_td: " ;;
   
   es)
       clear
       clear
       echo “KEYMAP=es” > /etc/vconsole.conf ;;
       
   us)
       clear
       clear
       echo “KEYMAP=us” > /etc/vconsole.conf ;;
       

       
   le)
       clear
       clear
       touch /etc/locale.conf
       echo "LANG=en_US.UTF-8" > /etc/locale.conf
#      echo "LC_CTYPE=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_NUMERIC=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_TIME=en_US.UTF-8" >> /etc/locale.conf
       echo "LC_COLLATE=en_US.UTF-8" >> /etc/locale.conf ;;
#      echo "LC_MONETARY=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_MESSAGES=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_PAPER=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_NAME=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_ADDRESS=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_TELEPHONE=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_MEASUREMENT=en_US.UTF-8" >> /etc/locale.conf
#      echo "LC_IDENTIFICATION=en_US.UTF-8" >> /etc/locale.conf ;;
#      echo "LC_ALL= " >> /etc/locale.conf


       
   sl)
       clear
       clear
       locale ;;
       
       
   cm) 
       clear
       clear
       timedatectl set-timezone America/Mexico_City ;;
       
   td) 
       clear
       clear
       timedatectl status ;;
       
           
########################################################################
 g)
   clear
   clear
   echo " option (G) does NOTHING! (under construction) "
   echo "" ;;
   
     
########################################################################
##################### end of install script ############################
########################################################################


#-----------------------------------------------------------------------
# back to main menu
 mm) clear
     clear ;;
     
#-----------------------------------------------------------------------
# run screenfetch
  sf) 
     clear
     clear 
     screenfetch ;;

#-----------------------------------------------------------------------
# run htop
  ht)
      clear
      clear
       htop
      clear
      clear ;;

#-----------------------------------------------------------------------
# reboot system
  r) reboot ;;

#-----------------------------------------------------------------------
# shutdown system
  x) shutdown -h now ;;

#-----------------------------------------------------------------------
# exit this script
  Q) exit ;;
  q) exit ;;

#-----------------------------------------------------------------------
#

########################################################################
########################################################################
########################### end of script ##############################
########################################################################
########################################################################
esac
done
