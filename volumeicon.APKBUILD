# Contributor: Maato <maato softwarebakery com>
# Maintainer: Matthew T Hoare <matthew.t.hoare@gmail.com>
pkgname=volumeicon
pkgver=0.5.1
pkgrel=1
pkgdesc="Volume control for your system tray"
url="http://softwarebakery.com/maato/volumeicon.html"
arch="all"
license="GPL3"
depends="gtk+3.0 alsa-lib libnotify"
depends_dev="intltool git"
makedepends="$depends_dev"
install=""
subpackages="$pkgname-dev $pkgname-doc"
source="$pkgname-$pkgver.tar.gz::https://github.com/Maato/$pkgname/archive/${pkgver}.tar.gz"

builddir="${srcdir}"/$pkgname-$pkgver

prepare() {
	cd "$builddir" || return 1
	./autogen.sh || return 1
}

build() {
	cd "$builddir" || return 1
	./configure --prefix=/usr || return 1
	make PREFIX=/usr || return 1
}

package() {
	cd "$builddir" || return 1
	make DESTDIR="$pkgdir" PREFIX=/usr install || return 1
}

md5sums="edbc503f2ead5706d3c388f2b3608a37  volumeicon-0.5.1.tar.gz"
sha256sums="607979f316e6837eb7c65837c71b213a7dc6a2091153504f7b177a1d67f3da71  volumeicon-0.5.1.tar.gz"
sha512sums="c158a1a1bdf84e91fa039defc4c2a7fefa53f9a3ffc48b92388144fee6f7400f2e20618d3527d5c26f694d2280b1035fa4f91080ffe3b4baa5d229130d0c13b7  volumeicon-0.5.1.tar.gz"
