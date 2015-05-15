#!/usr/bin/env bash

echo "Updating brew formulae and running cask operations."
echo "This script requires sudo access to run."
echo

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install ffmpeg
brew install git
brew install htop-osx
brew install httpie
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install s3cmd
brew install tmux
brew install tree

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node
npm install -g grunt-cli
npm install -g bower

# We want to use pip and virtualenv and all of that.
brew install python
pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv
brew linkapps python

# Install caskroom so we can manage applications.
brew install caskroom/cask/brew-cask

# Now we need to install a bunch of casks.
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install keepingyouawake
brew cask install slack
brew cask install spotify
brew cask install the-unarchiver
brew cask install vagrant

# Alternate versions
brew tap caskroom/versions
brew cask install sublime-text3

# Remove outdated versions from the cellar.
brew cleanup