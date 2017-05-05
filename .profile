# command for change directory of node_modules:
# npm config set prefix "$HOME/.node_modules"

export LC_CTYPE="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME=$(/usr/libexec/java_home)
