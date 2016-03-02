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
mpdconf ~/.mpdconf
ncmpcpp ~/.ncmpcpp
globalignore ~/.globalignore
)

dotDir=`pwd`

echo "Initializing and updating submodules"
git submodule init
git submodule update

echo "Setting up your dotfiles, master."

for dotfile in ${(k)dotfiles}; do
	dest=$dotfiles[$dotfile]

	if [ -e $dest ]; then
		echo "$dest already exists."
	else
		echo "Creating symlink to $dotfile"
		ln -s $dotDir/$dotfile $dest
	fi

done

echo "KTHXBAI"
