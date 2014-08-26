ab() {
  cd ~/Work/atomicbrawl.com

  if [[ $# == 0 ]]; then
    tabname "brawl"
  else
    tabname "brawl ($1)"
  fi

  if [[ $1 == 'mongo' ]]; then
    # /usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod
    mongod
  elif [[ $1 == 'logstash' ]]; then
    cd logstash
    ./start.sh
  elif [[ $1 == 'mongo-log' ]]; then
    /usr/local/Cellar/mongodb/2.0.3-x86_64/bin/mongod run --config /usr/local/Cellar/mongodb/2.0.3-x86_64/mongod.conf -v --rest    
  elif [[ $1 == 'coffee' ]]; then
    ./node_modules/.bin/coffee
  elif [[ $1 == 'repl' ]]; then
    ./repl
  elif [[ $1 == 'console' ]]; then
    ./repl
  elif [[ $1 == 'browser-stack' ]]; then
    java -jar ~/Work/browserstack.com/BrowserStackTunnel.jar $BROWSER_STACK_KEY atomicbrawl.loc,40000,0,game.atomicbrawl.loc,50000,0,asset.atomicbrawl.loc,10000,0
  elif [[ $1 == 'generate-art-descriptions' ]]; then
    pie
    pie --dir /Users/chrisshorrock/Dropbox/atomic_brawl/patswerk/cards art_descriptions
  elif [[ $1 == 'rename-card' ]]; then
    mv src/cards/$1.coffee src/cards/$2.coffee
    mv assets/images/cards/$1.png assets/images/cards/$2.png
    mv src/test/cards/$1.coffee src/test/cards/$2.coffee
  elif [[ $1 == 'test' && $# == 2 ]]; then
    pie -t $2 test
  elif [[ $1 == 'blog-server' ]]; then
    cd ~/Work/blog.atomicbrawl.com
    rake preview
  elif [[ $1 == 'blog-watch' ]]; then
    cd ~/Work/blog.atomicbrawl.com
    rake watch
  elif [[ $1 == 'blog-deploy' ]]; then
    cd ~/Work/blog.atomicbrawl.com
    rake clean generate deploy
  elif [[ $1 == 'tunnel' ]]; then
    ssh app@meta1.atomicbrawl.com -L $AB_MONGO_PORT:$AB_MONGO_IP:$AB_MONGO_PORT -N
  elif [[ $1 == 'logstash-tunnel' ]]; then
    ssh app@admin.atomicbrawl.com -L 8000:127.0.0.1:8000 -L 9200:127.0.0.1:9200 -N
  elif [[ ($1 == 'ack' || $1 == 'a' || $1 == 'find' || $1 == 'f') && $# -gt 1 ]]; then
    shift
    ack "$@" src/**/*.*
  elif [[ $1 == "test-servers" ]]; then
    NODE_ENV=test pie servers
  elif [[ $# != 0 ]]; then
    pie $@
  fi 
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

