# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="wezm"

# ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.yarn/bin:$HOME/.node_modules/bin"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code"
fi

# Example aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias archey="$HOME/Documents/archey-osx/bin/archey -c"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias gsl="git stash list"
alias gss="git stash save"
alias gcm="git checkout master"
alias gcp="git checkout production"

source "$HOME/.profile"
