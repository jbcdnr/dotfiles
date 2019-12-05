# bashrc to launch ZSH when cannot `chsh` to ZSH on the system

# test for remote connection to avoid breaking SCP login for example
[ -z "$PS1" ] && return
test -f /usr/bin/zsh && exec /usr/bin/zsh
exit
