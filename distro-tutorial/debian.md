## Installing Debian
Use the following command to install the latest stable release of Debian:
```
proot-distro install debian
```

## Logging in to Debian
Use the following command to login to Debian as root:
```
proot-distro login debian
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

## Logging in to Debian with a user
Use the following command to login Debian as a user:
```
proot-distro login debian --user hitominikki
```
> [!NOTE]
> or replace "hitominikki" with your desired username.

### Install a desktop environment
<details><summary>XFCE4</summary>
Use the following command to install the packages for the desktop environment:
  
```
sudo apt install xfce4
```
> At this point, please logout!
Use the following command to add a convenient way to login:
```
nano startxfce.sh
```
in the GNU nano text editor please type:
```
proot-distro login debian --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - droidmaster -c "env DISPLAY=:0 startxfce4"'
```
> or replace "hitominikki" with your desired username!
Grant the sh file execute permission:
```
chmod +x startxfce.sh
```
To start desktop environment, please use this command every time:
```
./startxfce.sh
```
</details>
