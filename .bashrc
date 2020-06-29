# bashrc to launch ZSH when cannot `chsh` to ZSH on the system

# test for remote connection to avoid breaking SCP login for example
#[ -z "$PS1" ] && return
#test -f /usr/bin/zsh && exec /usr/bin/zsh
#exit
# source the common Brain bashrc (go/brain-bashrc)
if [ -r /google/data/ro/teams/brain-frameworks/config/bashrc ] ; then
  source /google/data/ro/teams/brain-frameworks/config/bashrc
fi

eval "$(starship init bash)"

alias ls="ls --color"
alias ll="ls -l --color"
alias la="ls -a --color"

# zsh like completion:
# https://superuser.com/questions/288714/bash-autocomplete-like-zsh
set show-all-if-ambiguous on
TAB:menu-complete

