# JB's Dotfiles

These are my dot files for macOS and Linux. Feel free to use them.

To install them check out the dependencies below and run the following commands:

```bash
cd
git clone https://github.com/jbcdnr/dotfiles.git
cd dotfiles
./bootstrap.sh  # type 'y' to confirm
```

Please open an issue if you get in troubles.

## Preview

![](./docs/prompt_and_git.png)
![](./docs/vim.png)

## Dependencies

### Install packages

Install [HomeBrew](https://brew.sh/) and then some really useful software:

```bash
brew cask install iterm2 sublime-text visual-studio-code skim spectacle
brew install parallel tmux vim thefuck zsh
```

Use ZSH

```bash
chsh -s /bin/zsh `whoami`
```

### macOS config

Hide the dock and change the animation delay:

```
defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock
```

Enable 3 fingers drag for trackpad.

Remap caps lock to escape.

### iTerm config

- Appearance:
    - theme minimal
- Colors:
    - use solarized dark color scheme
    - uncheck "Brighten bold text"
- Text:
    - install [Powerline fonts](https://github.com/powerline/fonts), use Droid Sans Mono.
- Keys:
    - use the preset "Natural Text Editing"

## Credits

- [dircolors-solarized](https://github.com/seebi/dircolors-solarized) for `ls` coloring,
- [intellij-colors-solarized](https://github.com/jkaving/intellij-colors-solarized) for iTerm and IntelliJ.
