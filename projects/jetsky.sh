ab() {
  cd ~/Work/atomic-brawl
  tabname "brawl ($1)"

  if [[ $1 == 'mongo' ]]
  then
    /usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod
  elif [[ $1 == 'mongo-log' ]]
  then
    /usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod run --config /usr/local/Cellar/mongodb/2.0.3-x86_64/mongod.conf -v --rest    
  elif [[ $1 == 'coffee' ]]
  then
    ./node_modules/.bin/coffee
  elif [[ $1 == 'browser-stack' ]]
  then
    java -jar ~/Work/BrowserStackTunnel.jar EcHY3oylYHVROEyPbpxr atomicbrawl.loc,40000,0,game.atomicbrawl.loc,50000,0,asset.atomicbrawl.loc,10000,0
  elif [[ $1 == 'generate-art-descriptions' ]]
  then
    pie
    pie --dir /Users/chrisshorrock/Dropbox/atomic_brawl/patswerk/cards art_descriptions
  elif [[ $1 == 'rename-card' ]]
  then
    mv src/cards/$1.coffee src/cards/$2.coffee
    mv assets/images/cards/$1.png assets/images/cards/$2.png
    mv src/test/cards/$1.coffee src/test/cards/$2.coffee
  elif [[ $1 == 'pie' ]]
  then
    pie
  elif [[ $# != 0 ]]
  then
    pie $@
  fi 
}

export NODE_ENV=development

source $HOME/.nvm/nvm.sh

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


