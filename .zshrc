# Path to your oh-my-zsh installation.
export ZSH=/Users/redvi/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="wezm"

# ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacs'
fi

# Example aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias archey="$HOME/Documents/archey-osx/bin/archey -c"
alias mc='mc -S modarcon16'
alias duh='du -d 1 -h'
export LC_CTYPE="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"

# hook for change version of node (with nave)
autoload -U add-zsh-hook
load-naverc() {
  if [[ -f .naverc && -r .naverc ]]; then
    source .naverc
  fi
}
add-zsh-hook chpwd load-naverc

source "$HOME/.profile"
