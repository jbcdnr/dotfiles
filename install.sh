#!/usr/bin/env bash

# Taken from Oscar's dotfiles https://github.com/oscartackstrom/dotfiles

# Install zsh and set as default.
if [[ `uname` != 'Darwin' ]]; then
  sudo apt-get install -y zsh
  sudo chsh -s /bin/zsh $USER
fi

# # Install and configure Oh My ZSH (if it is not already installed).
# if [ -d "$HOME/.oh-my-zsh" ] 
# then
#     echo "oh-my-zsh is already installed" 
# else
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#     # Append zshrc stuff to end of file
#     touch ~/.zshrc # not sure if this will always exist at this point :/
#     cat .zshrc >> ~/.zshrc

#     # Install common theme.
#     echo "Installing themes"
#     curl -s -o $HOME/.oh-my-zsh/custom/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
# fi

# Install and configure git-machete (if it is not already installed).
if [ -d "~/.oh-my-zsh/custom/plugins/git-machete/" ]
then
    echo "git-machete is already installed"
else
    sudo -H pip install --user -U git-machete
    mkdir -p ~/.oh-my-zsh/custom/plugins/git-machete/
    curl -L https://raw.githubusercontent.com/VirtusLab/git-machete/master/completion/git-machete.completion.zsh -o $HOME/.oh-my-zsh/custom/plugins/git-machete/git-machete.plugin.zsh
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_CLONE_PATH="$SCRIPT_DIR"
for dotfile in "$DOTFILES_CLONE_PATH/".*; do
  # Skip `..` and '.'
  [[ $dotfile =~ \.{1,2}$ ]] && continue
  # Skip some files
  [[ $dotfile =~ \.git$ ]] && continue
  [[ $dotfile =~ \.gitignore$ ]] && continue
  [[ $dotfile =~ \.gitattributes$ ]] && continue
  [[ $dotfile =~ docs$ ]] && continue
  [[ $dotfile =~ iTerm2$ ]] && continue
  [[ $dotfile =~ duti.conf$ ]] && continue

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done
