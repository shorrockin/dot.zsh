export VM_MEMORY=3072

ch() {
  cd ~/Work/chimp.net

  if [[ $# == 0 ]]; then
    tabname "chimp (osx)"
  else
    tabname "chimp ($1)"
    /usr/bin/ssh $@
    tabname "chimp (osx)"
  fi
}
