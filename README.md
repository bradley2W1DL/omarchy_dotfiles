### Dotfiles
___

#### Setup Script
```bash
$ ./laptop/setup.sh
```

This script will
- symlink dotfiles from this repo into $HOME dir (using GNU Stow)
- install any CLI programs listed below (programs missing from Omarchy base install)

#### CLI based programs

- fish (shell alternative)
  - fisher (fish plugins)
  - breeze (git aliases)
  - oh-my-fish (themes, etc)
- zellij (terminal multiplexer)
- xclip -> TBD

#### Programs
- Ghostty -> supported in omarchy, just need to make default
- brave
- orbstack -> TBD - Omarchy uses lazy docker which would be good to experiment with
