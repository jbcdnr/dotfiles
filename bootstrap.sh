#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

declare -a dotfiles=('zshrc' 'gitconfig' 'gitignore_global' 'vimrc' 'paths' 'extra' 'exports' 'aliases' 'functions')

# declare -a dirs=('init' '.vim')
declare -a dirs=('.vim')

function doIt() {
   for dotfile in "${dotfiles[@]}"; do
     rm -rf "$HOME/.$dotfile" 2> /dev/null
     if [ -e  "`pwd`/.$dotfile" ]; then
       ln -s "`pwd`/.$dotfile" "$HOME/.$dotfile"
     fi
   done
   rm -rf ~/.antigen.zsh 2> /dev/null
   ln -s "`pwd`/antigen/antigen.zsh" "$HOME/.antigen.zsh"
   rsync  --exclude ".gitignore" \
		--exclude ".DS_Store" \
		-avh --no-perms "${dirs[@]}" ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
unset dotfiles;
unset dirs;
