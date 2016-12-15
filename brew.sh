#!/usr/bin/env bash

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
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install \
  git rename go sbt scala ffmpeg zsh unrar \
  youtube-dl zsh-completions mas
  
# Change shell to zsh
chsh -s /usr/local/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
	quicklook-csv quicklook-json epubquicklook \
	animated-gif-quicklook

# Install font tools.
brew cask install font-inconsolata
brew cask install font-inconsolata-dz

# Install applications
brew cask install \
  spotify dropbox transmission vlc skype \
  sublime-text3 calibre spectacle karabiner \
  slack iterm2 google-chrome firefox mactex
  
# Install App from Mac App Store
mas signin jb.cdnr@gmail.com
mas install 512617038 # SnappyApp

# Remove outdated versions from the cellar.
brew cleanup
