all: brew vim haskell tmux git shell latex

vim:
	echo "Linking vim ..."
	stow vim

haskell:
	echo "Linking GHCI configuration"
	stow haskell -t ~/.ghc

tmux:
	echo "Linking tmux and tmuxp ..."
	stow tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git:
	echo "Linking git ..."
	ln -s ${PWD}/git/.gitignore ~/.gitignore
	stow git

shell:
	echo "Linking shell profiles ..."
	stow shell

latex:
	echo "Linking latexmkrc..."
	stow latex

python:
	echo "Linking IPython profile preferences (mbp) ..."
	ln -fs ${PWD}/ipython/startup ~/.ipython/profile_mbp/startup
	ln -fs ${PWD}/ipython/extensions ~/.ipython/extensions
	ln -fs ${PWD}/ipython/ipython_config.py ~/.ipython/profile_mbp/ipython_config.py
	echo "Linking jupyter config..."
	stow jupyter
	echo "Linking matplotlibrc and styles..."
	stow matplotlib

brew:
	echo "Installing useful homebrew utilities"
	brew tap homebrew/bundle
	brew bundle
