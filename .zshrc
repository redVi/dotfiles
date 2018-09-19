# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="/usr/local/bin:/usr/local/opt/gettext/bin$PATH"

#eval "$(pyenv init -)"

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
ZSH_THEME="miloshadzic"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
alias myip="curl ipecho.net/plain; echo;"
alias nn="npm run"
alias mc="mc -S modarcon16"
alias duh="du -d 1 -h"
alias tree="tree -L 3 -I 'node_modules|.git'"
alias bs="brew services"
alias chdebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias grw="grep -rwn" # grep -rwn '/path/to/dir' -e 'some word in text'
