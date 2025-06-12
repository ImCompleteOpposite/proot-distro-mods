# Introduction:
This is a tutorial and also a modification for Termux's proot distro. This repository provides detailed tutorials for using the proot-distro utility and provide modifications for the proot-distro utility.

## Prerequisites of the project
<details><strong><summary>Install requirements</strong></summary>
 
> It is highly encouraged that you download the prerequisites in Github.
 1. <a href="https://github.com/termux/termux-app/releases">Termux</a><br>
 2. <a href="https://github.com/termux/termux-x11/releases">Termux:X11</a><br><hr>
</details>

Open Termux and Install the following packages on termux using this command:
  
```
pkg update && pkg upgrade -y && pkg install x11-repo -y && pkg install termux-x11-nightly -y && pkg install tur-repo -y && pkg install pulseaudio -y && pkg install wget -y && pkg install git -y && pkg install proot-distro -y
```

## Choosing a Linux Distribution for Proot-Distro
There are only few linux distributions available in <strong>proot-distro</strong> and you can see the list by using the command:

```
proot-distro list
```

> [!NOTE]
> As of 6/12/25 the only available Linux Distributions in Proot-Distro are: Adélie Linux, Alpine Linux, Arch Linux, Artix Linux, Chimera Linux, Debian, Deepin, Fedora, Manjaro, OpenSUSE, Pardus, Rocky Linux, Ubuntu, and Void Linux.

> [!NOTE]
> and proot-distro now only provides one version of each linux distributions. for example, Proot-Distro will only have the latest long term support version for Ubuntu, and will only have the latest stable version of Debian and the other Linux Distributions.
> As of 6/12/25, the versions of each distributions are:
> * `adelie`: Adelie Linux
> * `alpine`: Alpine Linux (edge)
> * `archlinux`: Arch Linux / Arch Linux 32 / Arch Linux ARM
> * `artix`: Artix Linux (AArch64 only)
> * `chimera`: Chimera Linux
> * `debian`: Debian (bookworm)
> * `deepin`: deepin (beige)
> * `fedora`: Fedora 42 (64bit only)
> * `manjaro`: Manjaro (AArch64 only)
> * `opensuse`: openSUSE (Tumbleweed)
> * `pardus`: Pardus (yirmiuc)
> * `rockylinux`: Rocky Linux (9.5)
> * `ubuntu`: Ubuntu (24.04)
> * `void`: Void Linux

For any additional information.. please check the proot-distro github: https://github.com/termux/proot-distro/

## Installing the desired linux distribution
There will be a separate tutorial page for installing Linux distributions:
* `adelie`: Unavailable 
* `alpine`: Unavailable
* `archlinux`: Unavailabile
* `artix`: Unavailable
* `chimera`: Unavailable
* `debian`: <a href="/distro-tutorial/debian.md/">Available</a>
* `deepin`: Unavailable
* `fedora`: Unavailable 
* `manjaro`: Unavailable
* `opensuse`: Unavailable
* `pardus`: Unavailable
* `rockylinux`: Unavailable
* `ubuntu`: Unavailable
* `void`: Unavailable

As of currently there is alot of unavailable tutorials for Linux Distributions and for those, check: https://github.com/LinuxDroidMaster/Termux-Desktops/

and for custom distributions, you may have to check "Proot-Distro Extra Tutorials" in this page.

## Proot-Distro Extra Tutorials
> [!NOTE]
> use the following command "proot-distro" for available commands related to the proot-distro utility.

#### I. If you desire to have another of the same distribution you can use the following command:
```
proot-distro install debian --override-alias debianalt
```
> [!NOTE]
> You can replace "debianalt" with any alias like "ubuntu2" or your desired alias.

to login to the container use the following command:
```
proot-distro login debianalt
```
```
proot-distro login debianalt --user hitominikki
```
> [!NOTE]
> replace "debianalt" with your desired alias and with the sh file!

to remove the container use the following command:
```
proot-distro remove debianalt
```
> [!NOTE]
> replace "debianalt" with your desired alias.

#### II. Import custom distribution 
> [!NOTE]
> a rootfs file can be a live cloud image that is typically tar.xz

1. Obtain a rootfs file (typically tar.xz) and copy the download link... or download the file and remember the file location path.
2. Return to termux and use the following command:
```
cd $PREFIX/etc/proot-distro
```
3. Create a file "debian11.sh"
> [!NOTE]
> you can replace "debian11" with any alias!

4. Use the following command to enter to the text editor
```
nano debian11.sh
```
5. Type this to file:
```
DISTRO_NAME="Debian (bookworm)"
DISTRO_COMMENT="Stable release."

TARBALL_URL['aarch64']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-aarch64-pd-v4.17.3.tar.xz"
TARBALL_SHA256['aarch64']="3a841a794ae5999b33e33b329582ed0379d4f54ca62c6ce5a8eb9cff5ef8900b"
TARBALL_URL['arm']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-arm-pd-v4.17.3.tar.xz"
TARBALL_SHA256['arm']="85861ab139d4042302796cf46a93a9efbcb4808c06f7a1ae5fb71812f4564424"
TARBALL_URL['i686']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-i686-pd-v4.17.3.tar.xz"
TARBALL_SHA256['i686']="1fb3a6b0ea679e3797b35984049abf22bfe3b6ab79e9bb98cdfc54994712e1e4"
TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-x86_64-pd-v4.17.3.tar.xz"
TARBALL_SHA256['x86_64']="675e534333adcbf369e97abda3088927651e5d91612ae5727c52ff2284f4b8c8"

distro_setup() {
	# Configure en_US.UTF-8 locale.
	sed -i -E 's/#[[:space:]]?(en_US.UTF-8[[:space:]]+UTF-8)/\1/g' ./etc/locale.gen
	run_proot_cmd DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
}

 
```
> [!NOTE]
> unfortunately I have nothing to say for "distro_setup() {}" as it is distribution specific, you will have to conduct your own experiment.

in regards to the "TARBALL_SHA256" you will have to do following:
> [!NOTE]
a. remember the file path or url of the rootfs file
b. use the following command to generate a sha256sum:
```
sha256sum /storage/emulated/0/termux/debian-11.tar.xz
```
c. copy the output (exclude the filename. sha256 only)
d. paste the sha256 output to the "TARBALL_SHA256" of the respective distribution and architecture.
