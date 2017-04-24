# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="wezm"

# ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR="vim"
source $ZSH/oh-my-zsh.sh

# Example aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias archey="$HOME/Documents/archey-osx/bin/archey -c"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias gsl="git stash list"
alias gss="git stash save"

export LC_CTYPE="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"

source "$HOME/.profile"
