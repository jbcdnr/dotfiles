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
  zgen oh-my-zsh plugins/gcloud
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/thefuck

  zgen load zsh-users/zsh-syntax-highlighting

  # themes
  zgen load denysdovhan/spaceship-prompt spaceship

  # generate the init script from plugins above
  zgen save

  # to regenerate settings run
  # zgen reset
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{paths,exports,aliases,extra,prompt}; do
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

# disable conda environment prefix
if hash conda 2>/dev/null; then
  conda config --set changeps1 False
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cordonni/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
    conda config --set changeps1 False
else
    if [ -f "/Users/cordonni/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cordonni/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cordonni/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

