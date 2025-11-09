### Dotfiles

___

#### Setup Script

```bash
./laptop/setup.sh
```

**This script will:**

- symlink dotfiles from this repo into $HOME dir (using GNU Stow)
- symlink the "theme" file into the neovim config
- install any CLI programs listed below (programs missing from Omarchy base install)

#### CLI based programs

- fish (shell alternative)
  - fisher (fish plugins)
  - breeze (git aliases)
  - oh-my-fish (themes, etc)
- zellij (terminal multiplexer)
- xclip -> TBD
- 1password-cli

#### Programs

- Ghostty -> supported in Omarchy, just need to make default
- brave
- orbstack -> TBD - Omarchy uses lazy docker which would be good to experiment with

#### Note on install

This project uses a submodule for the nvim config.  It's a fork of the LazyVim starter repo that has been modified to my liking.

Because of this you should clone the project with the `--recurse-submodules` flag (`git clone --recurse-submodules <URL>`)

Alternatively, after cloning this repo you'll need to run two commands to initialize this submodule:
`git submodule init` to initialize the local config file
`git submodule update` to fetch all the data from the submodule project into the dot-config/nvim project directory.

For more info on git submodules checkout the [docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
