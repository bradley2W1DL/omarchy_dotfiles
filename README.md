### Dotfiles
___

#### Setup Script
```bash
$ ./laptop/setup.sh
```

This script will
- symlink dotfiles from this repo into $HOME dir (using GNU Stow)
- install the CLI programs listed below

#### CLI based programs

- homebrew
- git
- neovim
  - ripgrep (dependency for live_grep to work)
- fish (shell alternative)
  - fisher (fish plugins)
  - breeze (git aliases)
  - oh-my-fish (themes, etc)
- asdf (package manager)
  - ruby
  - node
  - yarn
  - rust
- zellij (terminal multiplexer)

#### Programs
- Ghostty
- obsidian
- spotify
- chrome
- brave
- orbstack
- amphetamine
- rectangle

##### TODO
- get asdf package installs working
  - I think just need to create a .tool-versions file (not symlinked)
