#!/bin/zsh

# Shred my history from servers

for login in $@
do
	echo "---> $login"
	ssh -t "$login" "shred -uzn 10 \
		~/.bash_history\
		~/.zsh_history\
		~/.viminfo\
		~/.rediscli_history\
		~/.psql_history\
		"
done
