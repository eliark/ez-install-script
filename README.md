# Created by ELIAS WALKER 
# 
# These programs iare free software; you can redistribute them and/or modify
# them under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# These programs are distributed in the hope that they will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

############################################################################

FIRST OF ALL
thank you for trying my distrobution.



1111 is the default password (only necessary when using "su" or when root password is needed)
it is not needed when using sudo.

liveuser needs no password as sudo


ARROW Linux is under development. so dont expect everthing to work perfectly. 
if you find any bugs or have any suggestions you can contact me at 

arrowlinux@gmail.com

arrowlinux@outlook.com

############################################################################

# to install with EZ
# format the drive you want arch installed to.
# then mount it to /mnt

mount /dev/sdx0 /mnt

# (x0) being the drive letter and partition number)
# like this,,,
               mount /dev/sda1 /mnt

# if you are not sure run
lsblk 



# then after that is finnished and everything is mounted correctly


# in the terminal migrate to /home/liveuser/Desktop/ez-install-script

cd /home/liveuser/Desktop/ez-install-script

# and run (as root) 

sudo ./ez-strap-in.sh

# it will install the base system 

# then when that is finnished run

sudo ./ez-install.sh

# this will install everything else. full auto. only stopping to ask
# for a new root password, and a new user password.


# if you want you can use my arch1 script to install another desktop,
# or a swapfile as well as many other things. 

sudo ./arch1

# then just go down the list a,b,c,d,e,f
# and install what you need or want.
 

