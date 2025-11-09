#!/bin/bash

if command -v fish >/dev/null 2>&1;
  then exec fish ./install.fish;
else
  echo "\n- fish not found — installing... sudo pacman -S fish";
  sudo pacman -S fish;
  echo "rerun this setup script again"
  exit 1;
fi

