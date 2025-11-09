#!/usr/bin/fish

# zellij + stow
sudo pacman -S --noconfirm --needed zellij stow

# Bonasai tree gen
yay -S --noconfirm --needed cbonsai

# run stow to copy dotfiles to $HOME/.config
fish ./stow.fish

# symlink the Omarchy nvim theme file. (force)
ln -sf $HOME/.config/nvim/lua/plugins/theme.lua $HOME/.config/omarchy/current/theme/neovim.lua
