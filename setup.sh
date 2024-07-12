#!/bin/zsh

# Sets up my dotfiles

typeset -A dotfiles

dotfiles=(
aliases ~/.aliases
bashrc ~/.bashrc
gitconfig ~/.gitconfig
vim ~/.vim
vimrc ~/.vimrc
oh-my-zsh ~/.oh-my-zsh
zshrc ~/.zshrc
devilspie2 ~/.config/devilspie2
gemrc ~/.gemrc
irbrc ~/.irbrc
psqlrc ~/.psqlrc
mpdconf ~/.mpdconf
ncmpcpp ~/.ncmpcpp
globalignore ~/.globalignore
Xresources ~/.Xresources
xmonad.hs ~/.xmonad/xmonad.hs
xmobarrc ~/.xmobarrc
xmobar ~/.xmobar
kitty ~/.config/kitty
railsrc ~/.railsrc
xbindkeysrc ~/.xbindkeysrc
)

dotDir=`pwd`

echo "Initializing and updating submodules"
git submodule init
git submodule update

echo "Copying dotfiles"

for dotfile in ${(k)dotfiles}; do
	dest=$dotfiles[$dotfile]

	if [ -e $dest ]; then
		echo "$dest already exists."
	else
		echo "Creating symlink to $dotfile"
		ln -s $dotDir/$dotfile $dest
	fi
done

echo "Done copying dotfiles"

if [[ $SPIN ]]; then
	echo "Setting up SPIN"

	echo "source ~/dotfiles/zshrc" >> ~/.zshrc
	git config --global user.email $(cat /etc/spin/secrets/email)

	zsh ~/dotfiles/bin/build-vim-head.sh
fi
