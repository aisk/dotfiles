#! /usr/bin/env sh

ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.axelrc ~/.axelrc
ln -sf $PWD/.emacs ~/.emacs
ln -sf $PWD/.irbrc ~/.irbrc
ln -sf $PWD/.pryrc ~/.pryrc
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.minttyrc ~/.minttyrc
mkdir -p $HOME/.ipython/profile_default
ln -sf $PWD/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
