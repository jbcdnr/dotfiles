# install zgen for the first time
[ -e "$HOME/.zgen/zgen.zsh" ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# load zgen
source "$HOME/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  pip install thefuck

  # plugins
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/sbt
  zgen oh-my-zsh plugins/scala
  zgen oh-my-zsh plugins/sublime
  zgen oh-my-zsh plugins/macos
  zgen oh-my-zsh plugins/gcloud
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/thefuck
  zgen oh-my-zsh plugins/git-machete
  
  zgen load zsh-users/zsh-syntax-highlighting

  # themes
  zgen load spaceship-prompt/spaceship-prompt spaceship

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

# disable conda environment prefix if installed
( conda config --set changeps1 False ) 2> /dev/null

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

