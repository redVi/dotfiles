#~/.zshrc
# chsh -s /bin/zsh user
# autocompletion for ArchLinux:
# zsh-yaourt, zsh-packer from AUR
#
#Autocomplete
autoload -U compinit promptinit
compinit
promptinit
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman
setopt CORRECT_ALL
SPROMPT="Ошибка! ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
setopt autocd
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on
zmodload zsh/complist
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# autocomplit
zstyle ':completion:*:*:(^rm):*:*files' ignored-pacodeerns '*?.o' '*?.c~' \
'*?.old' '*?.pro'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
# Colorize red for root, green for normal users
if [[ "$USER" == "root" ]]; then
  COLOR="%{[0m[01;31m%}"
else
  COLOR="%{[0m[01;32m%}"
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}'
# prompt (if running screen, show window #)
if [ x$WINDOW != x ]; then
    export PS1="$COLOR$WINDOW:%{[01;34m%}%~ $COLOR%#%{[0m%} "
else
    export PS1="%{[01;34m%}%~ $COLOR%#%{[0m%} "
fi

# If we're using a dumb terminal (ie. emacs), assume we don't want colour.
if [[ "$TERM" == "dumb" ]]; then
        export PS1="%~ %# "
fi

# Атрибуты доступа для новых файлов
umask 022
# Отключение звукового сигнала
setopt  No_Beep

# Сочетание клавиш в стиле vi
# bindkey -v
# Сочетание клавиш в стиле emacs
bindkey -e
# Стандартные сочетания клавиш emacs
#Ctrl+a     в начало строки
#Ctrl+e     в конец строки
#Ctrl+b     на символ назад
#Ctrl+c     завершить
#Ctrl+f     на символ вперед
#Ctrl+k     удалить до конца строки
#Ctrl+u     удалить все символы слева от курсора до начала строки
#Сtrl+w     удалить символы слева от курсора до начала слова
#Ctrl+t     меняет символ под курсором на предыдущий
#Ctrl+Shift+- отмена
#ALt+l      привести к нижнему регистру
#Alt+u      привести к верхнему регистру
#Alt+C      первая буква заглавная
#Ctrl+l     clear
#Ctrl+p     previous
#Ctrl+n     next
bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left
bindkey ';5C' forward-word #ctrl+right

# Export
export EDITOR="/usr/bin/vim"
export TERM=xterm-256color
export PATH="$PATH:/home/$USER/bin"
export PYTHONSTARTUP=~/.pythonrc
export RUBYOPT=rubygems
#
# Aliases
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias sudo='A=`alias` sudo '
alias pacman='sudo pacman-color'
alias sc='sudo systemctl'
alias nc='sudo netcfg'
alias -s {avi,mkv,mpeg,mpg,mov,m2v,mp4,wmv}=mplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {ogg,mp3,wav,wma}=cmus
autoload -U pick-web-browser
alias -s {html,htm}=chromium
alias -s sh=sh
alias -s py=python

#  History
export HISTFILE=~/.zsh_history
export HISTSIZE=100
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# zsh-syntax-highlighting from AUR
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES=(
        'alias'           'fg=153,bold'
        'builtin'         'fg=153'
        'function'        'fg=166'
        'command'         'fg=153'
        'precommand'      'fg=153, underline'
        'hashed-commands' 'fg=153'
        'path'            'underline'
        'globbing'        'fg=166'
)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Распаковка архивов
# example: extract file
extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# Запаковать архив
# example: pk tar file
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# Using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache'
