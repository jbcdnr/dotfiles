# MacOS Set up

Install [brew](https://brew.sh)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install apps

```bash
brew install --cask \
    1password \
    anaconda \
    figma \
    firefox \
    google-cloud-sdk \
    iterm2 \
    kDrive \
    mactex \
    rectangle \
    signal \
    sketch \
    slack \
    spotify \
    telegram \
    tev \
    visual-studio-code \
    vlc \
    whatsapp \
    zoom
```

Install packages

```bash
brew install \
    coreutils \
    findutils \
    gawk \
    gh \
    git \
    git-open \
    gnu-getopt \
    gnu-indent \
    gnu-sed \
    gnu-tar \
    gnutls \
    grep \
    ncdu \
    npm \
    parallel \
    thefuck \
    tldr \
    tmux \
    tree \
    yarn \
    z
```

Install fonts

```bash
brew install \
    homebrew/cask-fonts/font-inconsolata \
    homebrew/cask-fonts/font-inconsolata-nerd-font \
    font-droid-sans-mono-for-powerline
```

Setup Google Cloud

```
gcloud auth login
```

Set up Anaconda

```
/usr/local/anaconda3/bin/conda init zsh
```


Select dynamic profile in iTerm

`iTerm2 > Advanced > Path to folder with dynamic profiles : ~/dotfiles/iTerm2`

Quick autohide dock

```
defaults write com.apple.dock autohide -boolean true && \
defaults write com.apple.dock autohide-time-modifier -float 0.3 && \
defaults write com.apple.dock autohide-delay -float 0 && \
defaults write com.apple.dock minimize-to-application -boolean true && \
defaults write com.apple.dock show-recents -int 0 && \
killall Dock
```

Set hot corners
```
defaults write com.apple.dock wvous-bl-corner -integer 4        # Bottom left Desktop
defaults write com.apple.dock wvous-bl-modifier -integer 131072 # with Shift
defaults write com.apple.dock wvous-tl-corner -integer 1        # Top left nothing
defaults write com.apple.dock wvous-tr-corner -integer 1        # Top right nothing
defaults write com.apple.dock wvous-br-corner -integer 1        # Bottom right nothing
```


Three fingers drag enabled
```
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
```


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

Firefox disable zoom with ctrl + mousewheel

Visit [about:config](about:config) in Firefox and set `mousewheel.with_meta.action` and `mousewheel.with_control.action` to 1.

Set default apps

```
brew install duti
duti duti.conf
```

Disable touch bar