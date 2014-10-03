export VM_MEMORY=3072

ch() {
  cd ~/Work/chimp.net
  tabname "chimp (osx)"

  if [[ $# == 0 ]]; then
    # nothing
  elif [[ $1 == 'start' ]]; then
    vagrant up
    tabname "chimp (vagrant)"
    /usr/bin/ssh vagrant
    tabname "chimp (osx)"
  elif [[ $1 == 'stop' ]]; then
    vagrant halt
  else
    tabname "chimp ($1)"
    /usr/bin/ssh $@
    tabname "chimp (osx)"
  fi
}
