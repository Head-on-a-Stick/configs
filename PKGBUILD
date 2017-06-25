# Maintainer: Head_on_a_Stick <matthew.t.hoare at gmail dot com>

pkgname=bunsen-pepperflash
pkgdesc="Download script for Adobe's Pepper Flash Plugin with systemd .timer integration."
pkgver=0.1
pkgrel=2
arch=('i686' 'x86_64')
licence=('GPL')
depends=('gcc-libs' 'glibc')
optdepends=('flashplugin: Settings utility')
conflicts=('chromium-pepper-flash' 'pepper-flash')
url='https://github.com/Head-on-a-Stick'

source=('get-adobe-flashver.py'
	'update-bunsen-pepperflash'
	'bunsen-pepperflash.service'
	'bunsen-pepperflash.timer'
	'bl-notify-broadcast'
	'bl-notify-failure@.service')

package() {
	install -Dm0644 get-adobe-flashver.py "$pkgdir"/usr/lib/bunsen/pepperflash/get-adobe-flashver.py
	install -Dm0644 update-bunsen-pepperflash "$pkgdir"/usr/bin/update-bunsen-pepperflash
	install -Dm0644 bunsen-pepperflash.service "$pkgdir"/usr/lib/systemd/system/bunsen-pepperflash.service
	install -Dm0644 bunsen-pepperflash.timer "$pkgdir"/usr/lib/systemd/system/bunsen-pepperflash.timer
	install -Dm0644 bl-notify-broadcast "$pkgdir"/usr/bin/bl-notify-broadcast
	install -Dm0644 bl-notify-failure@.service "$pkgdir"/usr/lib/systemd/system/bl-notify-failure@.service
}

sha1sums=('299aebc08263f86abadbf5c8e3e8278ad8488aee'
	  '137df86052b850bd40d6f94cc86c782ffc68d6c0'
	  '99e17b3396fa482819de771e9161dfe9401ec3ee'
	  '10f2586b34e60bb5004f9800ffda448df362f9b7'
	  'fbffe87f85b34cbb8189c992e14569f93ac3f31d'
	  'a0e5e9ac7586e25d64f7f9a54682d1f8dd3a184e')
