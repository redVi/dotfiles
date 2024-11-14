export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="wezm"
# themes: wezm, norm, gozilla, macovsky

zstyle ':omz:update' mode reminder  # auto, disabled, reminder, frequency 30
plugins=(git)

# User configuration
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
export EDITOR="vim"
source $ZSH/oh-my-zsh.sh

# Aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias nng="npm list -g"
alias duh="du -d 1 -h"
alias tree="tree -L 3 -I 'node_modules|.git'"
alias bs="brew services"
alias datenum="date '+%Y-%m-%d'"
alias chdebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias pserver="python3 -m http.server 8080"
alias docker-compose="$HOME/.docker/cli-plugins/docker-compose"

export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Dev/flutter/bin

# Add RVM to PATH
export PATH="$PATH:$HOME/.rvm/bin"
