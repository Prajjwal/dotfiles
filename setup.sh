#!/bin/bash

# Sets up my dotfiles

currentDir=`pwd`
dotfiles=( aliases bashrc gitconfig vim vimrc )

echo "Initializing and updating submodules"
git submodule init
git submodule update

echo "Setting up your dotfiles, master."

for dotfile in ${dotfiles[@]}; do
	if [ -e ~/.$dotfile ]; then
		echo "~/.$dotfile already exists."
	else
		echo "Creating symlink to $dotfile"
		ln -s $currentDir/$dotfile ~/.$dotfile
	fi
done

echo "KTHXBAI"
