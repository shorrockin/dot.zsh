alias chimp='cd ~ && cd ~/Work/chimp'
alias chimp-server='chimp && rails server'
alias chimp-console='chimp && ./script/rails console'
alias chimp-deploy-dev='rake dev vlad:deploy'
alias chimp-make-tags='make-tags app test config lib'
alias chimp-init='chimp && mysql.server start && rake ts:start'
alias chimp-reset-all='rake db:migrate VERSION=0 && rake development:reset_all'
alias ct="chimp-test"
alias chimp-sync-avatars='rsync -ave ssh deploy@prod:/home/deploy/chimp/shared/system/ /Users/chrisshorrock/Work/chimp/public/system/'
alias chimp-sync-avatars-to-disco='rsync -ave ssh /Users/chrisshorrock/Work/chimp/public/system/ deploy@disco:/home/deploy/chimp/shared/system/'
alias browser-stack-chimp="java -jar ~/Work/BrowserStackTunnel.jar EcHY3oylYHVROEyPbpxr chimp.loc,3000,0"

source /Users/chrisshorrock/.rvm/scripts/rvm

cco() {
  git checkout $1
  chimp
}

mkdb() { 
  mysql -uroot -proot -e "create database $1 character set utf8 collate utf8_general_ci"
}

chimp-test() {
  chimp

  if [[ $# = 0 ]]
  then
    echo "running all tests for chimp"
    rake test
  else
    if [[ $1 = "units" || $1 = "functionals" || $1 = "integration" ]]
    then
      echo "running $1 for chimp"
      rake test:$1
    else
      echo "running a single test for chimp $@"
      if [[ $# == 1 ]]
      then 
        bundle exec ruby -Ilib:test $1
      else
        bundle exec ruby -Ilib:test $1 --name=$2
      fi
    fi
  fi
}

rails-db-clean() {
  rake db:migrate VERSION=0
}

