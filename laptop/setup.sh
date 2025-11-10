#!/bin/bash

############################
#
# Install all the basic packages to get rollin'
#
################################

# Step 0: get mad permissions
export CURRENT_USER=$(whoami)
echo "Let's setup $CURRENT_USER"
sudo -v -u $CURRENT_USER

# Step 1: install fish
if command -v fish &> /dev/null
then
  echo 'fish shell already installed 🎣'
else
  echo '🐡 installing fish...'
  pacman -S --no-confirm --needed fish
fi

# Ensure fish is default shell and can execute commands
if ! command -v fish &> /dev/null
then
  echo '💣 something has gone terribly wrong...check that "pacman" and "fish" exist on the $PATH'
  exit 1
fi

export FISH_BIN=$(which fish)
# Add fish to list of acceptable shells
# first check that it hasn't already been added:
if grep -Fxq $FISH_BIN /etc/shells
then
  echo "🎣 Fish already an accepted shell"
else
  echo "adding Fish to /etc/shells 🎣"
  echo $FISH_BIN | sudo tee -a /etc/shells
fi

# make fish the default login shell
sudo chsh -s $FISH_BIN $CURRENT_USER

# execute remaining setup scripts in fish
fish <<FISH_SCRIPT
  # use GNU Stow instead of setup_symlinks
  $(pwd)/laptop/stow.fish
  $(pwd)/laptop/install.fish
FISH_SCRIPT

