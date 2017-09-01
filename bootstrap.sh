#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

declare -a dotfiles=('zshrc' 'gitconfig' 'gitignore_global' 'vimrc' 'paths' 'extra' 'exports' 'aliases' 'minimal.zsh-theme')

declare -a dirs=('.vim')

function doIt() {
  for dotfile in "${dotfiles[@]}"; do
    rm -rf "$HOME/.$dotfile" 2> /dev/null
    if [ -e  "`pwd`/.$dotfile" ]; then
      ln -s "`pwd`/.$dotfile" "$HOME/.$dotfile"
    fi
  done
  rsync  --exclude ".gitignore" \
    --exclude ".DS_Store" \
    -avh --no-perms "${dirs[@]}" ~;

  # reset zgen
  zgen reset

  # link sublime text settings for macOS
  [[ `uname` == "Darwin" ]] && ln -s "$HOME/dotfiles/init/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
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
