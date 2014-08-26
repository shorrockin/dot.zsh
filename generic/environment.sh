# -----------------------------------------------
# Set up the Environment
# -----------------------------------------------
EDITOR=vim
PAGER=most
RSYNC_RSH=/usr/bin/ssh
PATH=./bin:./node_modules/.bin:.:$PATH
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000

export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS=' -R '

export TERM EDITOR PAGER RSYNC_RSH CVSROOT FIGNORE DISPLAY NNTPSERVER PATH HISTFILE HISTSIZE SAVEHIST
