#!/usr/bin/env sh

echo "Linking vim ..."
ln -fs ${PWD}/vim/vimrc ~/.vimrc
ln -fs ${PWD}/vim/encrypted_vimrc ~/.encrypted_vimrc
rm ~/.vim
ln -fs ${PWD}/vim ~/.vim

echo "Linking nvim ..."
ln -fs ${PWD}/vim/vimrc ~/.nvimrc
rm ~/.nvim
ln -fs ${PWD}/vim ~/.nvim

echo "Linking tmux ..."
ln -fs ${PWD}/tmux_conf ~/.tmux.conf
ln -fs ${PWD}/tmux-powerlinerc ~/.tmux-powerlinerc

echo "Linking git ..."
ln -fs ${PWD}/git/gitconfig ~/.gitconfig
ln -fs ${PWD}/git/gitignore ~/.gitignore

echo "Linking shell profiles ..."
ln -fs ${PWD}/bash_profile ~/.bash_profile
ln -fs ${PWD}/zshrc ~/.zshrc

echo "Linking inputrc ..."
ln -fs ${PWD}/inputrc ~/.inputrc

echo "Key bindings ..."
ln -fs ${PWD}/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

echo "Done."
