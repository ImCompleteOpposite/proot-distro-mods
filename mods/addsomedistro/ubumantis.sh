# This is a default distribution plug-in.
# Do not modify this file as your changes will be overwritten on next update.
# If you want customize installation, please make a copy.
DISTRO_NAME="Ubuntu (23.10)"
DISTRO_COMMENT="Standard release (Mantis)."

TARBALL_URL['aarch64']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-mantic-aarch64-pd-v4.8.0.tar.xz"
TARBALL_SHA256['aarch64']="91acaa786b8e2fbba56a9fd0f8a1188cee482b5c7baeed707b29ddaa9a294daa"
TARBALL_URL['arm']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-mantic-arm-pd-v4.8.0.tar.xz"
TARBALL_SHA256['arm']="eb968b49e61892d8f02fcee88e130169e737838a8f94f9464e58b2c9cd84e003"
TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.8.0/ubuntu-mantic-x86_64-pd-v4.8.0.tar.xz"
TARBALL_SHA256['x86_64']="b621afb46a182ce2aa06d06b2d3bc077bbdf08b3557b892d5ca74ff1c9afc206"

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
