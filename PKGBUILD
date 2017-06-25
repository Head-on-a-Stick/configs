# Maintainer: Head_on_a_Stick <matthew.t.hoare at gmail dot com>

pkgname=bunsen-pepperflash
pkgdesc="Download script for Adobe's Pepper Flash Plugin with systemd .timer integration."
pkgver=0.1
pkgrel=3
arch=('i686' 'x86_64')
licence=('GPL')
depends=('gcc-libs' 'glibc' 'bash' 'python3')
optdepends=('flashplugin: Settings utility')
conflicts=('chromium-pepper-flash' 'pepper-flash')
url='https://github.com/Head-on-a-Stick'
install=bunsen-pepperflash.install
source=('get-adobe-flashver.py'
	'update-bunsen-pepperflash'
	'bunsen-pepperflash.service'
	'bunsen-pepperflash.timer'
	'bl-notify-broadcast'
	'bl-notify-failure@.service')

package() {
	install -Dm644 get-adobe-flashver.py "$pkgdir"/usr/lib/bunsen/pepperflash/get-adobe-flashver.py
	install -Dm644 update-bunsen-pepperflash "$pkgdir"/usr/bin/update-bunsen-pepperflash
	install -Dm644 bunsen-pepperflash.service "$pkgdir"/usr/lib/systemd/system/bunsen-pepperflash.service
	install -Dm644 bunsen-pepperflash.timer "$pkgdir"/usr/lib/systemd/system/bunsen-pepperflash.timer
	install -Dm644 bl-notify-broadcast "$pkgdir"/usr/bin/bl-notify-broadcast
	install -Dm644 bl-notify-failure@.service "$pkgdir"/usr/lib/systemd/system/bl-notify-failure@.service
}

sha1sums=('299aebc08263f86abadbf5c8e3e8278ad8488aee'
	  'b1a14170a2efb90c0257eb2d28c1a4e34e23b67d'
	  '0f102dc1d3e895a41575523c5789830e0c34f970'
	  '10f2586b34e60bb5004f9800ffda448df362f9b7'
	  'fbffe87f85b34cbb8189c992e14569f93ac3f31d'
	  'a0e5e9ac7586e25d64f7f9a54682d1f8dd3a184e')
