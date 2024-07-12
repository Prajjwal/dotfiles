#!/bin/zsh

cd ~/src

curl --silent -L "https://github.com/vim/vim/archive/refs/heads/master.zip" > vim.zip
unzip vim.zip
cd vim-master/src

sudo apt install make clang libtool-bin libpython3-dev libruby
./configure \
	--with-features=huge \
	--enable-python3interp \
	--enable-fail-if-missing \
	--with-python3-command=/usr/bin/python3 \
	--enable-rubyinterp \
	--with-ruby-command=/usr/local/bin/ruby

make -j 8
sudo make install
