# This tutorial is for Ubuntu!
- This tutorial was made in Ubuntu 24.04
- This tutorial is expected to work with later versions of Ubuntu.
- This tutorial is also expected to work with previous versions of Ubuntu (such as 23.10, 22.04, 20.04)

## Installing Ubuntu
Use the following command to install the latest stable LTS release of Ubuntu:
```
proot-distro install ubuntu
```

## Logging in to Ubuntu 
Use the following command to login to Ubuntu as root:
```
proot-distro login ubuntu
```
Install necessary packages:
```
apt update -y
apt install sudo nano adduser -y
```
Create a user account:
```
adduser hitominikki
```
Grant user sudo privileges:
```
nano /etc/sudoers
```
then scroll down until you can find "root ALL=(ALL:ALL) ALL"
and add "hitominikki ALL=(ALL:ALL) ALL" below the "root ALL=(ALL:ALL) ALL"
> [!NOTE]
> You are free to replace "hitominikki" to your desired username but must replace the "hitominikki" mentioned above in this tutorial to your desired username.

## Logging in to Ubuntu with a user
Use the following command to login Ubuntu as a user:
```
proot-distro login ubuntu --user hitominikki
```
> [!NOTE]
> or replace "hitominikki" with your desired username.

### Install a desktop environment
> [!NOTE]
> This tutorial is compatible with: GNOME,  XFCE4, KDE Plasma, Cinnamon, MATE, LXDE, LXQt, Sugar, WindowMaker, Enlightenment, and FVWM Crystal.

Use the following command to install the packages for the desktop environment:
  
```
sudo apt install xfce4
```
> [!NOTE]
> desire other desktop environment? replace "xfce4" with...
> * `gnome`: ubuntu-desktop dbus-x11
> * `kde_plasma`: kde-plasma-desktop
> * `cinnamon`: cinnamon
> * `mate`: mate-desktop-environment
> * `lxde`: lxde
> * `lxqt`: lxqt
> * `sugar`: sugar-session
> * `enlightenment`: enlightenment
> * `windowmaker`: wmaker
> * `fvwm_crystal`: fvwm_crystal

> if you desided to download gnome, please use this command after gnome is installed:
```
for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file
done
```
and disable snapd as termux does not support such feature:
```
cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
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
proot-distro login ubuntu --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - hitominikki -c "env DISPLAY=:0 startxfce4"'
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
proot-distro login ubuntu --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && sudo service dbus start && su - hitominikki -c "env DISPLAY=:0 gnome-shell --x11"'
exit 0
```
> or replace "hitominikki" with your desired username!

> and if you are using other desktop environment, replace "startxfce4" with..
> * `kde_plasma`: startplasma-x11
> * `cinnamon`: cinnamon-session
> * `mate`: mate-session
> * `lxde`: startlxde
> * `lxqt`: startlxqt
> * `sugar`: sugar
> * `enlightenment`: enlightenment_start
> * `windowmaker`: startwmaker
> * `fvwm_crystal`: fvwm_crystal
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
