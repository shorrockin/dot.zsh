source /Users/chrisshorrock/.rvm/scripts/rvm

export VM_MEMORY=3072

ch() {
  cd ~/Work/chimp.net
  tabname "chimp ($1)"

  if [[ $1 == 'server' ]]; then
    ./script/rails server
  elif [[ $1 == 'console' ]]; then
    ./script/rails console
  elif [[ $1 == 'test' ]]; then
    shift
    if [[ $# -lt 2 ]]; then 
        rspec --format d $@
    else
        TEST_NAME=$1
        shift
        rspec --format d $TEST_NAME -e $1
    fi
  elif [[ $1 == 'template' ]]; then
    echo "todo subject line here ($2)" > ~/Work/chimp.net/app/views/email_templates/$2.subject.liquid
    echo "todo text content here ($2)" > ~/Work/chimp.net/app/views/email_templates/$2.text.liquid
    echo "todo html content here ($2)" > ~/Work/chimp.net/app/views/email_templates/$2.html.liquid
  elif [[ $1 == 'init' ]]; then
    mysql.server start
    rake ts:start
  elif [[ $1 == 'sync-avatars' ]]; then
    rsync -ave ssh deploy@prod:/home/deploy/chimp/shared/system/ /Users/chrisshorrock/Work/chimp.net/public/system/
  elif [[ $1 == 'sync-avatars-disco' ]]; then
    rsync -ave ssh /Users/chrisshorrock/Work/chimp.net/public/system/ deploy@disco:/home/deploy/chimp/shared/system/
  elif [[ $1 == 'sync-avatars-jazeera' ]]; then
    rsync -ave ssh /Users/chrisshorrock/Work/chimp.net/public/system/ deploy@jazeera:/home/deploy/chimp/shared/system/
  elif [[ $1 == 'make-db' ]]; then
    mysql -uroot -proot -e "create database $2 character set utf8 collate utf8_general_ci"
  elif [[ $1 == 'browser-stack' ]]; then
    java -jar ~/Work/browserstack.com/BrowserStackTunnel.jar $BROWSER_STACK_KEY localhost,3000,0
  elif [[ $1 == 'routes' ]]; then
    if [[ $# == 2 ]]; then
      rake routes | grep $2
    else
      rake routes
    fi
  elif [[ $1 == 'spork' ]]; then
    spork
  elif [[ $1 == 'mailcatcher' ]]; then
    mailcatcher
  elif [[ $1 == 'migrate' ]]; then
    rake db:migrate db:data:migrate
  elif [[ ($1 == 'ack' || $1 == 'a' || $1 == 'find' || $1 == 'f') && $# -gt 1 ]]; then
    shift
    ack "$@" app/**/*.*
  elif [[ $# != 0 ]]; then
    rake $@
  fi
}