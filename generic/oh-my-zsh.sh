# -----------------------------------------------
# Set up the prompt and plugins via oh-my-zsh
# -----------------------------------------------
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=chrisshorrock
ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all
unsetopt auto_cd
