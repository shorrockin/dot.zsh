## Command Aliases
alias x=exit
alias c=clear
alias s=screen
alias r='screen -R'
alias vi='vim'
alias l='ls -lFh'     #size,show type,human readable
alias ll='ls -lFha'
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias e='emacs'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

gsub() {
 ack -l ${1} | xargs sed -i '' "s/${1}/${2}/g"
}

lines() {
  more ${1} | nl -ba
}

tags-generate() {
  ctags -a -e -f TAGS --tag-relative -R $@
}

tags-ruby-generate() {
  find . -name "*.rb" -print | etags -
}

simple-server() {
  python -m "SimpleHTTPServer"
}

go-test() {
    go test $@ $(go list ./...  | grep -v /vendor/)
    for pkg in $(go list ./... |grep -v /vendor/)
    do
        golint $pkg
    done
}

go-delete-test-files() {
    find . -name "*.test" -type f -delete
}
