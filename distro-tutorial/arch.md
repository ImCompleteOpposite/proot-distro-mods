# This tutorial is for Arch Linux!

## Installing Arch
Use the following command to install the latest stable release of Arch:
```
proot-distro install archlinux
```

## Logging in to Debian
Use the following command to login to Arch as root:
```
proot-distro login archlinux
```
Install necessary packages:
```
yes | pacman -Sy --disable-download-timeout
yes | pacman -Syu --disable-download-timeout 
yes | pacman -S sudo --disable-download-timeout
```
Create a user account:
```
useradd -m -G wheel hitominikki
passwd hitominikki
```
Grant user sudo privileges:
```
nano /etc/sudoers
```
then scroll down until you can find "root ALL=(ALL:ALL) ALL"
and add "hitominikki ALL=(ALL:ALL) ALL" below the "root ALL=(ALL:ALL) ALL"
> [!NOTE]
> You are free to replace "hitominikki" to your desired username but must replace the "hitominikki" mentioned above in this tutorial to your desired username.

## Logging in to Arch with a user
Use the following command to login Debian as a user:
```
proot-distro login archlinux --user hitominikki
```
> [!NOTE]
> or replace "hitominikki" with your desired username.

### Install a desktop environment
> [!NOTE]
> This tutorial is compatible with: GNOME,  XFCE4, KDE Plasma, Cinnamon, MATE, LXDE, LXQt, Sugar, WindowMaker, Enlightenment, and FVWM Crystal.

Use the following command to install the packages for the desktop environment:
  
```
yes | pacman -S xfce4 --disable-download-timeout
```
> [!NOTE]
> desire other desktop environment? replace "xfce4" with...
> * `gnome`: gnome dbus gnome-terminal gnome-tweaks
> * `kde_plasma`: plasma-desktop sudo dbus kde-applications kde-graphics kde-utilities konsole thunar
> * `cinnamon`: cinnamon

> if you desided to download gnome, please use this command after gnome is installed:
```
for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file
done
```
## Boot into desktop environment
> [!NOTE]
> This took me a while but thanks to LinuxDroidMaster's Termux-Desktops Repository got this one optimized!

> At this point onward, please logout!
Use the following command to add a convenient way to login:
```
nano startxfce.sh
```
> [!NOTE]
> the filename "startxfce.sh" is not strict and could be called any filename.

in the GNU nano text editor please type:

for all desktop environments BUT GNOME:
```
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &
sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1
proot-distro login archlinux --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - hitominikki -c "env DISPLAY=:0 startxfce4"'
exit 0
```
for GNOME:
```
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &
sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1
proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export DISPLAY=:0 XDG_RUNTIME_DIR=${TMPDIR} PULSE_SERVER=127.0.0.1 XDG_CURRENT_DESKTOP="GNOME" && rm -rf /run/dbus/pid && dbus-daemon --system && su - hitominikki -c "env DISPLAY=:0 dbus-launch gnome-shell --x11"'
exit 0
```
> or replace "hitominikki" with your desired username!

> and if you are using other desktop environment, replace "startxfce4" with..
> * `kde_plasma`: startplasma-x11

Grant the sh file execute permission:
```
chmod +x startxfce.sh
```
> [!NOTE]
> or replace "startxfce.sh" with desired filename.

To start desktop environment, please use this command every time:
```
./startxfce.sh
```
> [!NOTE]
> or replace "startxfce.sh" with desired filename
