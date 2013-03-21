#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

set -o vi

# Source aliases:
source ~/.aliases

# For configuration specific to a system:
[ -f ~/.localrc ] && source ~/.localrc
