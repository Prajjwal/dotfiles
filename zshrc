ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

DISABLE_AUTO_UPDATE=true

plugins=(git rsync torrent extract)

export PATH=~/dotfiles/bin:$PATH

source $ZSH/oh-my-zsh.sh

source ~/.aliases

source ~/.rbenv/completions/rbenv.zsh

set -o vi

# Source localrc for system specific config
[ -f ~/.localrc ] && source ~/.localrc
