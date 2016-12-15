

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Auto-complete configuration 
fpath=(/usr/local/share/zsh-completions $fpath)

# CONFIG
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE="false"

# ANTIGEN
source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle sbt
antigen bundle scala
antigen bundle go
antigen bundle sudo
antigen bundle sublime
antigen bundle osx

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme minimal

# Tell antigen that you're done.
antigen apply