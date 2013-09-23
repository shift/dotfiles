#!/usr/bin/env bash

echo -n "Setting up: "

echo -n "tmux.conf"
mv ~/.tmux.conf ~/.tmux.conf.bak > /dev/null 2>&1
ln -s $PWD/tmux.conf ~/.tmux.conf
cp -a $PWD/tmux ~/.tmux
echo -n ". "

echo -n "vimrc"
mv ~/.vimrc ~/.vimrc.bak  > /dev/null 2>&1
ln -s $PWD/vimrc ~/.vimrc
echo -n ". "

echo "vim-pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
echo ". "
echo "Done"

rvm use system
sudo gem install vimmer
vimmer install http://www.vim.org/scripts/script.php?script_id=3520
