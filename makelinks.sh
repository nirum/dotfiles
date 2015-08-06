#!/usr/bin/env bash

echo "Linking vim ..."
ln -fs ${PWD}/vim/vimrc ~/.vimrc
ln -fs ${PWD}/vim/encrypted_vimrc ~/.encrypted_vimrc
rm ~/.vim
ln -fs ${PWD}/vim ~/.vim

echo "Linking nvim ..."
ln -fs ${PWD}/vim/vimrc ~/.nvimrc
rm ~/.nvim
ln -fs ${PWD}/vim ~/.nvim

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Linking GHCI configuration"
ln -fs ${PWD}/ghci.conf ~/.ghc/ghci.conf

echo "Linking tmux wrapper script"
sudo ln -fs ${PWD}/safe-reattach-to-user-namespace.sh /usr/local/bin/safe-reattach-to-user-namespace

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

echo "Linking IPython profile preferences (mbp) ..."
rm -r ~/.ipython/profile_mbp/static
rm -r ~/.ipython/profile_mbp/startup
ln -fs ${PWD}/ipython/static ~/.ipython/profile_mbp/static
ln -fs ${PWD}/ipython/startup ~/.ipython/profile_mbp/startup

echo "Linking matplotlibrc ..."
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ln -fs ${PWD}/ipython/matplotlibrc ~/.matplotlib/matplotlibrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ln -fs ${PWD}/ipython/matplotlibrc ~/.matplotlib/matplotlibrc
fi

echo "Git SSH credential helper ..."
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
elif [[ "$OSTYPE" == "darwin"* ]]; then
  git config --global credential.helper osxkeychain
fi

echo "Done."
