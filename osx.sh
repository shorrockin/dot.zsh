alias emacs='emacsclient --alternate-editor=emacs'
alias colored='ack --flush --passthru --color --color-match=blue "DEBUG" | ack --flush --passthru --color --color-match=yellow "WARN(ING)?" |  ack --flush --passthru --color --color-match=red "ERROR" | ack --flush --passthru --color --color-match=red "^.*FAILURE.*" | ack --flush --passthru --color --color-match=green "BUILD SUCCESSFUL" | ack --flush --passthru --color --color-match=green "^Tests run: .*" | ack --flush --passthru --color --color-match=blue "\-\-\-*"'

source ~/.zsh/generic/boot2docker.sh

tail() { 
  /usr/bin/tail $@ | colored 
}

tabname() {
  printf "\e]1;$1\a"
}
