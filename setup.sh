#!/bin/bash

# Sets up my dotfiles

dotfiles=( aliases bashrc gitconfig vim vimrc )

echo "Setting up your dotfiles, master."

for dotfile in ${dotfiles[@]}; do
	if [ -e ~/.$dotfile ]; then
		echo "~/.$dotfile already exists."
	else
		echo "Creating symlink to $dotfile"
		ln -s `pwd`/$dotfile ~/.$dotfile
	fi
done

echo "KTHXBAI"
