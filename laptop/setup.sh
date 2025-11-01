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

# Step 1: ensure homebrew is installed
if command -v brew &> /dev/null
then 
  echo 'homebrew already installed 🍺'
else
  echo 'homebrew needs to be installed...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add brew to zsh path
  echo '# set PATH, MANPATH, etc. for Homebrew.' >> ~/.zshrc
  echo export PATH=$PATH:/opt/homebrew/bin >> ~/.zshrc

  echo 'brew success! 🍻'
fi

# makes sure `brew` is accessible in $PATH
source ~/.zshrc

# Step 2: install fish
if command -v fish &> /dev/null
then
  echo 'fish shell already installed 🎣'
else
  echo '🐡 installing fish...'
  brew install fish
fi

# Ensure fish is default shell and can execute commands
if ! command -v fish &> /dev/null
then
  echo '💣 something has gone terribly wrong...check that "brew" and "fish" exist on the $PATH'
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
  # ensure hombrew is in the $PATH
  fish_add_path /opt/homebrew/bin

  # use GNU Stow instead of setup_symlinks
  $(pwd)/laptop/stow.fish
  $(pwd)/laptop/install.fish
FISH_SCRIPT

