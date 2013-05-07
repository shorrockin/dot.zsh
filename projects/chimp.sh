source /Users/chrisshorrock/.rvm/scripts/rvm

ch() {
  cd ~/Work/chimp
  tabname "chimp ($1)"

  if [[ $1 == 'server' ]]; then
    ./script/rails server
  elif [[ $1 == 'console' ]]; then
    ./script/rails console
  elif [[ $1 == 'test' ]]; then
    shift
    rspec $@
  elif [[ $1 == 'template' ]]; then
    echo "todo subject line here ($2)" > ~/Work/chimp/app/views/email_templates/$2.subject.liquid
    echo "todo text content here ($2)" > ~/Work/chimp/app/views/email_templates/$2.text.liquid
    echo "todo html content here ($2)" > ~/Work/chimp/app/views/email_templates/$2.html.liquid
  elif [[ $1 == 'init' ]]; then
    mysql.server start
    rake ts:start
  elif [[ $1 == 'sync-avatars' ]]; then
    rsync -ave ssh deploy@prod:/home/deploy/chimp/shared/system/ /Users/chrisshorrock/Work/chimp/public/system/
  elif [[ $1 == 'sync-avatars-disco' ]]; then
    rsync -ave ssh /Users/chrisshorrock/Work/chimp/public/system/ deploy@disco:/home/deploy/chimp/shared/system/
  elif [[ $1 == 'make-db' ]]; then
    mysql -uroot -proot -e "create database $2 character set utf8 collate utf8_general_ci"
  elif [[ $1 == 'browser-stack' ]]; then
    java -jar ~/Work/BrowserStackTunnel.jar $BROWSER_STACK_KEY chimp.loc,3000,0
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
  elif [[ $# != 0 ]]; then
    rails $@
  fi
}