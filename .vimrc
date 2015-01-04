" set antialias
set lines=95 columns=150   "custom size
set autoindent
set autoread
set t_Co=256
set foldopen=all
set foldenable
set foldmethod=indent
set foldlevel=1
syntax on
set nu
set mousehide
set termencoding=utf-8

" wrap words
set wrap
set linebreak

" no create .swp и ~ files
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251
set title                 "show buffer name
" ~/.vim/colors/
" :colorscheme railscasts
" set background=light
:set guioptions-=r        "remove right-hand scroll bar
:set guioptions-=L        "remove left-hand scroll bar
":set guioptions-=m       "remove menu bar
:set guioptions-=T        "remove toolbar

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" Plugin repos
Bundle 'moll/vim-node'
Bundle 'tpope/vim-rails'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
"Bundle 'garbas/vim-snipmate'
"Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wincent/command-t'
Bundle 'junegunn/vim-easy-align'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
"Bundle 'vim-scripts/taglist.vim'


let g:syntastic_enable_signs=1
let g:airline#extensions#tabline#enabled = 1

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall, :BundleClean, :BundleList
"
