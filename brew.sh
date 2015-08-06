#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install some other useful utilities like `sponge`.
brew install coreutils
brew install moreutils

# Install more recent versions of some OS X tools.
brew install macvim --override-system-vim

# neovim
brew tap neovim/neovim
brew install --HEAD neovim

# node
brew install node

# tmux
brew install tmux

# Install other useful binaries.
brew install ack
brew install the_silver_searcher
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install fasd

# QT graphics library
brew install qt

# exercism script
brew install exercism

# Remove outdated versions from the cellar.
brew cleanup
