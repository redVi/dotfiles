export ZSH="/Users/puma/.oh-my-zsh"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/gettext/bin$PATH"

ZSH_THEME="wezm"
# sonicradish

export UPDATE_ZSH_DAYS=30

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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
alias runios="react-native run-ios --simulator=\"iPhone 12\" --configuration=debug"
alias runios_device="react-native run-ios --simulator=\"MadCat\""
alias runandroid="react-native run-android --variant=debug"
alias buildandroid="cd android && ./gradlew installRelease"
alias runmetro="react-native start"

export ANDROID_HOME=/Volumes/Work/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
