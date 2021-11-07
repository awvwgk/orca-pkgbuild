# Maintainer: Sebastian Ehlert <awvwgk@disroot.org>

_realname=orca
pkgname=${_realname}-qm-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Ab initio, DFT, and semi-empirical SCF-MO package"
arch=('x86_64')
license=("custom")
provides=("${_realname}-qm")
depends=("openmpi")
makedepends=("patchelf")
optdepends=("lmod: Usage of orca environment module")
options=('!strip')
source=('local://orca_5_0_1_linux_x86-64_shared_openmpi411.tar.xz'
        'orca.lua'
        'orca.sh')
sha256sums=('84199af6931de9be261685f7f1d6d63b47eed8512ce1f2f93ca5356fed1cbae8'
            '5e733fe8808e5b1a4e3b277706d392a50c5c94ece3eaf5dac05dbad31ede4c56'
            '4a6e76e62c55a499fd0bad4cbc5308b2712610b71b371b74cda2e43b5a849778')
package() {
  local _prefix=orca_5_0_1_linux_x86-64_shared_openmpi411

  for f in ${_prefix}/orca* ${_prefix}/autoci*; do
    install -Dm755 "${f}" "${pkgdir}/opt/${_realname}/bin/$(basename ${f})"
    patchelf --set-rpath '$ORIGIN/../lib' "${pkgdir}/opt/${_realname}/bin/$(basename ${f})"
  done
  for f in ${_prefix}/otool*; do
    install -Dm755 "${f}" "${pkgdir}/opt/${_realname}/bin/$(basename ${f})"
  done
  for f in ${_prefix}/lib*; do
    install -Dm644 "${f}" "${pkgdir}/opt/${_realname}/lib/$(basename ${f})"
  done
  for f in ${_prefix}/EULA_ORCA* ${_prefix}/Third_Party_Licenses*; do
    install -Dm644 "${f}" "${pkgdir}/opt/${_realname}/share/licenses/$(basename ${f})"
  done
  install -Dm644 ${_realname}.lua "${pkgdir}/opt/${_realname}/share/modulefiles/${_realname}/${pkgver}.lua"
  install -Dm644 ${_realname}.sh "${pkgdir}/etc/profile.d/${_realname}-qm.sh"
}
