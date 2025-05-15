ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_PUSHD
unsetopt MULTIOS

function source_if_present () {
	if [[ -e "$1" ]]; then
		source "$1"
	fi
}

DISABLE_AUTO_UPDATE=true

plugins=(git gitfast rsync bundler colored-man-pages sudo z)

source $ZSH/oh-my-zsh.sh

source_if_present ~/dotfiles/bin/include/util.sh
source_if_present ~/.aliases
source_if_present ~/.rbenv/completions/rbenv.zsh

set -o vi

# Source localrc for system specific config
[[ -f ~/.localrc ]] && source ~/.localrc
