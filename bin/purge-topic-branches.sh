#!/bin/zsh

# Delete all local and remote refs that aren't long running (^master|unstable).
# TODO:
# - Read list of long running branches from a file
# - Default to master,unstable,development

source "${0%/*}/include/util.sh"

function merged_remote_refs {
	git branch --remote --merged | strip | sed -E 's/^origin\///'
}

function merged_refs {
	git branch --merged | strip
}

function impermanent_refs {
	grep -v 'master' | grep -v 'unstable'
}

function purge_refs {
	xargs -I{} git branch -d {}
}

function purge_remote_refs {
	xargs -I {} git push --delete origin {}
}

echo "---> Fetching remote refs"
git fetch --prune

echo "---> Checking out latest master"
git checkout master
git pull

echo "---> Deleting local refs"
merged_refs | impermanent_refs | purge_refs

echo "---> Deleting remote refs"
merged_remote_refs | impermanent_refs | purge_remote_refs
