alias jetsky='cd ~/Work/jetsky'
alias jetsky-server='jetsky && ./pie servers'
alias jetsky-server-growl='jetsky && ./pie --growl-on-restart servers'
alias jetsky-watch='jetsky && ./pie watch'
alias jetsky-console='jetsky && ./node_modules/.bin/coffee'
alias jetsky-upgrade='ssh jetsky "./deploy.sh"'
alias jetsky-mongo-log='/usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod run --config /usr/local/Cellar/mongodb/2.0.3-x86_64/mongod.conf -v --rest'
alias jetsky-mongo='/usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod'
alias jetsky-test-repl='pie && node --expose-gc compiled/test/execute.js --test=repl'
alias browser-stack-jetsky="java -jar ~/Work/BrowserStackTunnel.jar EcHY3oylYHVROEyPbpxr atomicbrawl.loc,40000,0,game.atomicbrawl.loc,50000,0,asset.atomicbrawl.loc,10000,0"

export NODE_ENV=development

source $HOME/.nvm/nvm.sh

make-coffee-tags() {
  ctags -a -e -f TAGS --tag-relative -R --langdef=coffee --langmap=coffee:.coffee --regex-coffee="/^[ \t]*([A-Za-z.]+)[ \t]+=.*->.*$/\1/f,function/" --regex-coffee="/^[ \t]*([A-Za-z.]+)[ \t]+=[^->\n]*$/\1/v,variable/" $@
}

rename-card() {
  jetsky
  mv src/cards/$1.coffee src/cards/$2.coffee
  mv assets/images/cards/$1.png assets/images/cards/$2.png
  mv src/test/cards/$1.coffee src/test/cards/$2.coffee
}

generate-art-descriptions() {
  jetsky
  pie
  pie --dir /Users/chrisshorrock/Dropbox/atomic_brawl/patswerk/cards art_descriptions
}

start-node-agent-game() {
  kill -SIGUSR2 `pgrep -f " game/server/start"`
}

start-node-agent-metagame() {
  kill -SIGUSR2 `pgrep -f " metagame/server/start"`
}

start-node-agent-test() {
  kill -SIGUSR2 `pgrep -f "compiled/test/execute.js"`
}

ulimit -n 10000


