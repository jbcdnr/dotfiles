Install [brew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
brew install --cask \
    1password \
    anaconda \
    figma \
    firefox \
    google-cloud-sdk
    iterm2 \
    rectangle \
    slack \
    spotify \
    visual-studio-code \
    tev \
    mactex \
    signal \
    whatsapp \
    telegram \
    zoom
```

```bash
brew install \
    parallel \
    git \
    git-open \
    tmux \
    npm \
    yarn \
    coreutils \
    homebrew/cask-fonts/font-inconsolata \
    homebrew/cask-fonts/font-inconsolata-nerd-font
```

Quick autohide dock

```
defaults write com.apple.dock autohide -boolean true && \
defaults write com.apple.dock autohide-time-modifier -float 0.3 && \
defaults write com.apple.dock autohide-delay -float 0 && \
defaults write com.apple.dock minimize-to-application -boolean true && \
defaults write com.apple.dock show-recents -int 0 && \
killall Dock
```

Set GCP

```
gcloud auth login
```

Set up conda

```
/usr/local/anaconda3/bin/conda init zsh
```


Select dynamic profile in iTerm (~/dotfiles/iTerm2)


Finder: show all filename extensions

```
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

Disable the warning when changing a file extension
```
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
```

When performing a search, search the current folder by default
```
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
```

Remap caps lock to escape

`Preferences / Keyboard / Modifier Keys...`
