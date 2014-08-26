lmc() {
  cd ~/Work/lmc

  if [[ $# == 0 ]]; then
    tabname "lmc (osx)"
  else
    tabname "lmc ($1)"
    /usr/bin/ssh $@
    tabname "lmc (osx)"
  fi

}
