alias ga='git add'
alias gf='git fetch'
alias gl='git-log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gam='git add . && git add -u . && git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'
alias g='git'
alias gp='git pull'

git-branch-name() {
  git name-rev --name-only HEAD
}

gpom() {
  git pull origin $(git-branch-name)
}

gpr() {
  git pull --rebase origin $(git-branch-name)
}

gpsh() { 
  git push origin $(git-branch-name)
}

gsp() {
  git stash && gpr && git stash apply
}

git-log() { 
  git log --graph --pretty=format:'%an: %s - %Cred%h%Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1
}

git-delete-remote-tag() {
  git push origin :refs/tags/$0
}

git-restore-to-head() {
  git cat-file -p HEAD:$1 > $1
}

git-track() {
  CURRENT_BRANCH=$(git-branch-name)
  git config branch.$CURRENT_BRANCH.remote $1
  git config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}