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
SPROMPT="Ошибка! Вы хотели ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
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
## Установка привычного поведения клавиш Delete, Home, End и т.д.:
#case $TERM in
#    linux)
#    bindkey "^[[2~" yank
#    bindkey "^[[3~" delete-char
#    bindkey "^[[5~" up-line-or-history
#    bindkey "^[[6~" down-line-or-history
#    bindkey "^[[1~" beginning-of-line
#    bindkey "^[[4~" end-of-line
#    bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
#    bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
#    bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
#    bindkey " " magic-space ## do history expansion on space
#    ;;
#    *xterm*|rxvt|(dt|k|E)term)
#    bindkey "^[[2~" yank
#    bindkey "^[[3~" delete-char
#    bindkey "^[[5~" up-line-or-history
#    bindkey "^[[6~" down-line-or-history
#    bindkey "^[[7~" beginning-of-line
#    bindkey "^[[8~" end-of-line
#    bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
#    bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
#    bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
#    bindkey " " magic-space ## do history expansion on space
#    ;;
#esac

export EDITOR="/usr/bin/vim"
export TERM=xterm-256color
export PATH="$PATH:/home/$USER/bin"
export LANG="en_US.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_ALL="en_US.UTF-8"
#
# Aliases
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias sudo='A=`alias` sudo '
alias pacman='pacman-color'
alias -s {avi,mpeg,mpg,mov,m2v}=mplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {ogg,mp3,wav,wma}=cmus
alias -s pdf=okular

#  History
export HISTFILE=~/.zsh_history
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

# Распаковка архивов
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


