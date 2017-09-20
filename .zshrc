# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="wezm"

# Plugins
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.yarn/bin:$HOME/.node_modules/bin:/usr/local/bin/docker-credential-helpers"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code"
fi

bindkey -e

# Example aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias archey="$HOME/Documents/archey-osx/bin/archey -c"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias bs="brew services"
alias nu5="nvm use 5.0"
alias chdebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias python="python3"
alias pyv=". $HOME/.venv/bin/activate"

source "$HOME/.profile"
