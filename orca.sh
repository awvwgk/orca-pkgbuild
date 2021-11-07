if command -v module >/dev/null 2>&1; then
  module use /opt/orca/share/modulefiles
else
  export PATH=/opt/orca/bin:$PATH
  orca () {
    /opt/orca/bin/orca "$@"
  }
fi
