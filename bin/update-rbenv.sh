#!/bin/zsh

# Update rbenv and all plugins. Assumes rbenv lives at ~/.rbenv

source "${0%/*}/include/util.sh"

cd ~/.rbenv/
say "updating rbenv"
git pull

cd plugins

PLUGIN_DIRS=$(ls ./)

for plugin_dir in $PLUGIN_DIRS; do
	say "updating plugin $plugin_dir"
	cd "$plugin_dir"
	git pull
	cd ../
done
