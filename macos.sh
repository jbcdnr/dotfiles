#!/bin/sh

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Hot corners
defaults write com.apple.dock wvous-bl-corner -integer 4        # Bottom left Desktop
defaults write com.apple.dock wvous-bl-modifier -integer 131072 # with Shift
defaults write com.apple.dock wvous-tl-corner -integer 1        # Top left nothing
defaults write com.apple.dock wvous-tr-corner -integer 1        # Top right nothing
defaults write com.apple.dock wvous-br-corner -integer 1        # Bottom right nothing

# Reload
killall Dock
