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
* `debian`: <a href="/distro/debian.md/">Available</a>
* `deepin`: Unavailable
* `fedora`: Unavailable 
* `manjaro`: Unavailable
* `opensuse`: Unavailable
* `pardus`: Unavailable
* `rockylinux`: Unavailable
* `ubuntu`: Unavailable
* `void`: Unavailable

## Proot-Distro Extra Tutorials
**Still working on it**
