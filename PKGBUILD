# Maintainer: Sebastian Ehlert <awvwgk@disroot.org>

_realname=orca
pkgname=${_realname}-qm-bin
pkgver=5.0.3
_openmpi_ver=4.1.1
pkgrel=1
pkgdesc="Ab initio, DFT, and semi-empirical SCF-MO package"
arch=('x86_64')
license=("custom")
provides=("${_realname}-qm")
depends=("openmpi")
makedepends=("patchelf")
optdepends=("lmod: Usage of orca environment module"
            "xtb: Semi-empirical tight binding calculations")
options=('!strip')
source=("local://orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz"
        'orca.lua'
        'orca.sh'
        'otool_xtb')
sha256sums=('b8b9076d1711150a6d6cb3eb30b18e2782fa847c5a86d8404b9339faef105043'
            '5e733fe8808e5b1a4e3b277706d392a50c5c94ece3eaf5dac05dbad31ede4c56'
            '4a6e76e62c55a499fd0bad4cbc5308b2712610b71b371b74cda2e43b5a849778'
            '16152a26a0706505ba5a3810e7a010c7a09c0a9afac01c4db4803424ec9ca0ad')

package() {
  local _prefix=orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}

  for f in ${_prefix}/orca* ${_prefix}/autoci*; do
    install -Dm755 "${f}" "${pkgdir}/opt/${_realname}/bin/$(basename ${f})"
    patchelf --set-rpath '$ORIGIN/../lib' "${pkgdir}/opt/${_realname}/bin/$(basename ${f})"
  done
  for f in ${_prefix}/otool* otool_xtb; do
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
