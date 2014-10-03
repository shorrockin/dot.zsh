lmc() {
  cd ~/Work/lmc
  tabname "lmc (osx)"

  if [[ $# == 0 ]]; then
    # nothing
  elif [[ $1 == 'start' ]]; then
    vagrant up
    tabname "lmc (vagrant)"
    /usr/bin/ssh vagrant
    tabname "lmc (osx)"
  elif [[ $1 == 'stop' ]]; then
    vagrant halt
  else
    tabname "lmc ($1)"
    /usr/bin/ssh $@
    tabname "lmc (osx)"
  fi

}
