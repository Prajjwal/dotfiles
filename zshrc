ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

DISABLE_AUTO_UPDATE=true

plugins=(git gitfast rsync torrent bundler colored-man-pages heroku yarn)

source $ZSH/oh-my-zsh.sh

source ~/.aliases

source ~/.rbenv/completions/rbenv.zsh

set -o vi

# Powerline

function powerline_precmd() {
    PS1="$(powerline-go\
		-error $?\
		-newline\
		-modules "nix-shell,venv,user,ssh,cwd,perms,git,hg,jobs,exit,root,vgo"\
		-cwd-mode plain\
		-mode patched\
		-shell zsh)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
	if hash powerline-go 2> /dev/null; then
		install_powerline_precmd
	fi
fi

# Source localrc for system specific config
[ -f ~/.localrc ] && source ~/.localrc
