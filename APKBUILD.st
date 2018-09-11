# Maintainer: Matthew T Hoare <matthew.t.hoare@gmail.com>
# Contributor: Sören Tempel <soeren+alpine@soeren-tempel.net>
# Contributor: Natanael Copa <ncopa@alpinelinux.org>

pkgname=st
pkgver=0.8.1
pkgrel=0
pkgdesc="A simple terminal implementation for X"
url="https://st.suckless.org"
arch="all"
license="MIT"
depends="ncurses-terminfo"
makedepends="fontconfig-dev freetype-dev libx11-dev libxext-dev libxft-dev"
subpackages="${pkgname}-doc ${pkgname}-dbg"
source="https://dl.suckless.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
st-scrollback-0.8.diff
st-scrollback-mouse-0.8.diff
st-scrollback-mouse-altscreen-0.8.diff"
builddir="${srcdir}/${pkgname}-${pkgver}"

prepare() {
   default_prepare
   cd "$builddir"
   sed -i '/tic/d' Makefile
   patch -p1 < ../st-scrollback-0.8.diff
   patch -p1 < ../st-scrollback-mouse-0.8.diff
   patch -p1 < ../st-scrollback-mouse-altscreen-0.8.diff
}

build() {
	cd "$builddir"
   make -C "$builddir"
}

package() {
	cd "$builddir"
	make install PREFIX=/usr DESTDIR="$pkgdir"
	mkdir -p "${pkgdir}/usr/share/applications"
	tee "${pkgdir}/usr/share/applications/st.desktop" <<!
[Desktop Entry]
Name=st
Comment=st is a simple virtual terminal emulator for X which sucks less
Exec=st
Terminal=false
Type=Application
Icon=gnome-xterm
Categories=System;TerminalEmulator;
!
}

sha512sums="787d35b0cc8b1435dad7809e9995bed3c7f781e012a4a43dd5ae3d670ebc0e4bc03a56ba3872ff8a3bdba316a41ba771c626adc8de0559296457a59170756c6b  st-0.8.1.tar.gz
3bf1f79273d490b22d4c45130aaf2a194b49da71656740bb8f69d45cfd9692de0b9eaccce4242004c823dc59289ca4ddf47ccd75ee50b4d3e3809e4ed6deee8b  st-scrollback-0.8.diff
980e4b7ac3a27995c303823bdc0dd0928dc72d74ad5632efc33631e43e01cb00681af542ce393a3e8ebe8daeb9a3ccb2089f03d4e23996efed2f1c105f1efac6  st-scrollback-mouse-0.8.diff
e3e56d6fc6770424ba5bfbbcd35dd2ef69418ba7e7518fe18c20b8cc74821633640a58368422ee2a7e8f1438fda5bcf5319c97fa6bb9d7a35a3ca7e3f22b0e5f  st-scrollback-mouse-altscreen-0.8.diff"
