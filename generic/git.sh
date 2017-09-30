alias ga='git add'
alias gf='git fetch'
alias gl='git-log'
alias gs='git status'
alias gd='git diff'
alias gm='git mergetool'
alias gam='git add --all . && git add -u . && git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'
alias g='git'
alias gp='git pull'
alias ts='tig status'
alias git-amend='git commit --amend'
alias git-undo='git reset --soft HEAD^'

git-branch-name() {
  git rev-parse --abbrev-ref HEAD
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

git-merge-deploy-master-push() {
    gco deploy
    git merge master
    gpsh
    gco master
    gpsh
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

git-branch() {
  git checkout -b $1
  git push --set-upstream origin $1
}

git-remember-password() {
    git config credential.helper store
    ssh-add ~/.ssh/id_rsa
}

git-track() {
  CURRENT_BRANCH=$(git-branch-name)
  git config branch.$CURRENT_BRANCH.remote $1
  git config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}

git-emoji() {
    echo "🎨 :art: when improving the format/structure of the code"
    echo "🚀 :rocket: when improving performance"
    echo "📝 :memo: when writing docs"
    echo "💡 :bulb: new idea"
    echo "🚧 :construction: work in progress"
    echo "👍 :thumbsup: when adding feature"
    echo "👎 :thumbsdown: when removing feature"
    echo "🔈 :speaker: when adding logging"
    echo "🔇 :mute: when reducing logging"
    echo "🐛 :bug: when fixing a bug"
    echo "✅ :white_check_mark: when adding tests"
    echo "💚 :green_heart: fixing tests / continuous integration"
    echo "🔒 :lock: when dealing with security"
    echo "⬆️ :arrow_up: when adding / upgrading dependencies"
    echo "⬇️ :arrow_down: when downgrading dependencies"
}

git config --global color.ui true
