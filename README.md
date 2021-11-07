# Arch Linux package file for Orca

This PKGBUILD file installs the [Orca program](https://orcaforum.kofo.mpg.de/app.php/portal) with pacman and makes it available on the system.
The main purpose of this PKGBUILD is to track the files installed with pacman and automatically apply some patches.
To make use of this PKGBUILD you first have to download the dynamically linked Orca distribution from the Orca forum.
Due to Orca's EULA no automatic download will be provided.


## RPATH fixing

To make sure the Orca binaries pick up the `liborca_*.so` library correctly, an runtime path is set for each binary by using `patchelf`.
This is important since this PKGBUILD installs into `/opt/orca/` rather than `/usr`.

Generally, it is a good idea to patch a dynamically linked Orca installation to ensure the `liborca_*.so` can always be found:

```bash
for f in ./orca* ./autoci*; do
  patchelf --set-rpath '$ORIGIN' "${f}"
done
```


## Orca function

Since Orca must be called with the full path to use MPI parallelization, a convenience function is installed which defines an `orca` function to always call the Orca binary with the full path.

```bash
orca () {
  /opt/orca/bin/orca "$@"
}
```


## Module file

Additionally a module file for [lmod](https://lmod.readthedocs.io/en/latest/) is provided.
If the [lmod](https://aur.archlinux.org/packages/lmod/) package is installed the Orca binaries are not added to the `PATH` by default.
The module file also sets a function to always call the Orca binary with the full path:

```lua
local prefix = pathJoin("/opt/orca")

set_shell_function(
  "orca",
  pathJoin(prefix, "bin", "orca") .. " \"$@\"",
  pathJoin(prefix, "bin", "orca") .. " $*")
```
