# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="wezm"

# Plugins
plugins=(git)

# User configuration
export PATH="$PATH:/usr/local/bin/docker-credential-helpers"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code"
fi

bindkey -e

# Aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias archey="$HOME/Documents/archey-osx/bin/archey -c"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias efix="./node_modules/.bin/eslint --fix"
alias tree="tree -L 3 -I 'node_modules|.git'"
alias bs="brew services"
alias chdebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias vpn-connect="sudo openconnect -b -u user_name vpn_host"
alias vpn-unconnect="sudo kill $(pgrep -f openconnect)"
alias dstop="docker stop $(docker ps -a -q)"
alias dstart="docker-compose up --build -d"
alias grw="grep -rwn" # grep -rwn '/path/to/dir' -e 'some word in text'

source "$HOME/.profile"
