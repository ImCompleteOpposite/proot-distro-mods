# This is a default distribution plug-in.
# Do not modify this file as your changes will be overwritten on next update.
# If you want customize installation, please make a copy.
DISTRO_NAME="Ubuntu (20.04)"
DISTRO_COMMENT="LTS release (Focal)."

TARBALL_URL['aarch64']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-focal-aarch64-pd-v4.8.0.tar.xz"
TARBALL_SHA256['aarch64']="386704baf86bebaf39141a92f4a5fa4cf4fdb94bcb55b85e94b1aea603e000ff"
TARBALL_URL['arm']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-focal-arm-pd-v4.8.0.tar.xz"
TARBALL_SHA256['arm']="ee38e86e7306f6d61683d5ffd0902ae3aa90550d062aac3ee412eba4db0e66dd"
TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-focal-x86_64-pd-v4.8.0.tar.xz"
TARBALL_SHA256['x86_64']="9ced22fc16aec1de554fd1d6fa12e628a27a6db2f00924b43d8b32cbeb1f1454"

distro_setup() {
	# Configure en_US.UTF-8 locale.
	sed -i -E 's/#[[:space:]]?(en_US.UTF-8[[:space:]]+UTF-8)/\1/g' ./etc/locale.gen
	run_proot_cmd DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

	# Configure Firefox PPA.
	echo "Configuring PPA repository for Firefox..."
	run_proot_cmd add-apt-repository --yes --no-update ppa:mozillateam/firefox-next || true
	cat <<- CONFIG_EOF > ./etc/apt/preferences.d/pin-mozilla-ppa
	Package: *
	Pin: release o=LP-PPA-mozillateam-firefox-next
	Pin-Priority: 9999
	CONFIG_EOF

	# Configure Thunderbird PPA.
	echo "Configuring PPA repository for Thunderbird..."
	run_proot_cmd add-apt-repository --yes --no-update ppa:mozillateam/thunderbird-next || true
	cat <<- CONFIG_EOF > ./etc/apt/preferences.d/pin-thunderbird-ppa
	Package: *
	Pin: release o=LP-PPA-mozillateam-thunderbird-next
	Pin-Priority: 9999
	CONFIG_EOF
}