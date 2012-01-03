alias git-branch-name='git name-rev --name-only HEAD'
alias ga='git add'
alias gp='git pull origin `git-branch-name`'
alias gpr='git pull --rebase origin `git-branch-name`'
alias gl='git-log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gam='git add . && git add -u . && git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpsh='git push origin `git-branch-name`'
alias gcl='git clone'
alias gsp='git stash && gpr && git stash apply'

git-log() { 
  git log --graph --pretty=format:'%an: %s - %Cred%h%Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative 
}

git-delete-remote-tag() {
  git push origin :refs/tags/$0
}

git-restore-to-head() {
  git cat-file -p HEAD:$1 > $1
}

parse-git-branch() { 
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' 
}

git-track() {
  CURRENT_BRANCH=$(parse-git-branch)
  git config branch.$CURRENT_BRANCH.remote $1
  git config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}



