if [ -z $JETSKY_HOME ]
then
    JETSKY_HOME="~/Work/jetsky"
fi

alias jetsky='cd $JETSKY_HOME'
alias jetsky-server='jetsky && ./cake servers'
alias jetsky-watch='jetsky && ./cake watch'
alias jetsky-console='jetsky && ./node_modules/.bin/coffee'
alias jetsky-upgrade='ssh jetsky@shorrockin.com "./deploy.sh"'
alias jetsky-mongo-log='/usr/local/Cellar/mongodb/2.0.1-x86_64/bin/mongod run --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf -v --rest'

make-coffee-tags() {
  ctags -a -e -f TAGS --tag-relative -R --langdef=coffee --langmap=coffee:.coffee --regex-coffee="/^[ \t]*([A-Za-z.]+)[ \t]+=.*->.*$/\1/f,function/" --regex-coffee="/^[ \t]*([A-Za-z.]+)[ \t]+=[^->\n]*$/\1/v,variable/" $@
}
