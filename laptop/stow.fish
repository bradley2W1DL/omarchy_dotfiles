#!/opt/homebrew/bin/fish

## Ensure "Stow" is installed and then run the stow command
if ! type -q stow
  echo "Installing GNU stow ..."
  brew install stow
end

# if .config dir already exists, create backups of any existing dirs that I want to symlink
if test -d $HOME/.config
  for filepath in (pwd)/.config/*
   set file (basename $filepath)
   set CONFIG_DIR $HOME/.config
   set BACKUP_DIR $HOME/.dotfiles_backup

   # file exists in $HOME/.config and is not already a symlink
   if test -d $CONFIG_DIR/$file && test ! -L $CONFIG_DIR/$file
     if test ! -d $BACKUP_DIR
       echo "📁 creating .dotfiles_backup directory"
       mkdir $BACKUP_DIR
     end

     echo "~/.config/$file exists, backing up now"
     cp -R $CONFIG_DIR/$file $BACKUP_DIR/
     if test $status -eq 0
       echo "...and remove existing"
       rm -rf $CONFIG_DIR/$file
     end
   end
  end
end

# stow symlinks all files/directories in $pwd into the home dir
# (everything not ignored by .stow-local-ignore) file
stow --target=$HOME --restow .

