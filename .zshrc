# install zgen for the first time
[ -e "$HOME/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# load zgen
source "$HOME/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # plugins
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/sbt
  zgen oh-my-zsh plugins/scala
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/sublime
  zgen oh-my-zsh plugins/osx

  # themes
  zgen load ~/.minimal.zsh-theme

  # generate the init script from plugins above
  zgen save

  # to regenerate settings run
  # zgen reset
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{paths,exports,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Auto-complete configuration
fpath=(/usr/local/share/zsh-completions $fpath)
# CONFIG
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE="false"

eval "$(dircolors ~/dotfiles/ressources/dircolors.256dark)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Z set up
if [ -f /usr/local/etc/profile.d/z.sh ]; then
  . /usr/local/etc/profile.d/z.sh
fi
