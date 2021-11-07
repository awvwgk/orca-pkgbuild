local name = "orca"
local version = myModuleVersion()
local prefix = pathJoin("/opt", name)

whatis("Name        : " .. name)
whatis("Version     : " .. version)
whatis("Description : ab initio, DFT, and semi-empirical SCF-MO package")
whatis("URL         : https://orcaforum.kofo.mpg.de/index.php")

prepend_path("PATH", pathJoin(prefix, "bin"))
set_shell_function(
  "orca",
  pathJoin(prefix, "bin", "orca") .. " \"$@\"",
  pathJoin(prefix, "bin", "orca") .. " $*")
