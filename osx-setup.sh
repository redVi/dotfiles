#!/bin/sh

# hostname
sudo scutil --set HostName restful_puma

# xcode
xcode-select --install

# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install rmtree wget unzip git cmus

# cask
brew cask install google-chrome \
visual-studio-code \
yandexdisk \
pocket \
iina

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# settings
mkdir homework && cd homework
git clone git@github.com:redVi/dotfiles.git && \
cp -a dotfiles/{.cmus, .vimrc, .zshrc, .gitconfig, .gitignore_global} ~/

# n node manager
curl -L https://git.io/n-install | bash
n latest
