export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="wezm" # sonicradish, norm, gozilla, macovsky

zstyle ':omz:update' mode reminder  # auto, disabled, reminder
zstyle ':omz:update' frequency 30

plugins=(git)

# User configuration
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
export EDITOR="vim"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias nng="npm list -g"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias tree="tree -L 3 -I 'node_modules|.git'"
alias bs="brew services"
alias datenum="date '+%Y-%m-%d'"
alias runmetro="npx react-native start"
alias runios="npx react-native run-ios --simulator=\"iPhone 13\" --configuration=debug"
alias runandroid="npx react-native run-android --variant=debug"
alias buildandroid="cd android && ./gradlew installRelease"
alias chdebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias dstart="docker-compose up --build -d"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
