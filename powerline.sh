#!/usr/bin/env bash

echo "Installing powerline and configuring."
echo "This script requires sudo access to run."
echo

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install 
pip install powerline-status

# Configuration
mkdir ~/.config/powerline
cp -R powerline/* ~/.config/powerline