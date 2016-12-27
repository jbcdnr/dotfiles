#!/usr/bin/env bash

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install \
  git rename go ffmpeg zsh unrar \
  youtube-dl zsh-completions mas tree

# Change shell to zsh
chsh -s /bin/zsh

# Install caskroom
brew install caskroom/cask/brew-cask
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# brew taps
brew tap caskroom/versions
brew tap caskroom/fonts

# brew cask quicklook plugins
brew cask install \
	qlcolorcode qlmarkdown qlprettypatch qlstephen \
	qlimagesize \
	quicklook-csv quicklook-json epubquicklook

# Install font tools.
brew cask install font-inconsolata
brew cask install font-inconsolata-dz

# Install JVM
brew cask install java

# Install scala environment
brew install sbt scala

# Install applications
brew cask install \
  spotify dropbox transmission vlc skype \
  sublime-text calibre spectacle karabiner-elements \
  slack iterm2 google-chrome firefox mactex nosleep \
  microsoft-office macdown skim anaconda

# Install App from Mac App Store
mas signin jb.cdnr@gmail.com
mas install 512617038 # SnappyApp
mas install 409201541 # Pages
mas install 409203825 # Numbers
mas install 409183694 # Keynote

# Remove outdated versions from the cellar.
brew cleanup
