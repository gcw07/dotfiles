#!/bin/bash

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Symlink the global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo 'Install oh-my-zsh'
  echo '-----------------'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo 'Install homebrew'
  echo '----------------'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
echo 'Install Brewfile packages'
echo '-------------------------'
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a Code directory
echo 'Setup Code Directory & Park Valet'
echo '---------------------------------'
mkdir -p $HOME/Code
cd $HOME/Code
valet park
cd $HOME

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/macos/.mackup.cfg $HOME/.mackup.cfg

# Clone Github repositories
./shell/clone.sh

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'

echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Make sure iCloud is running first. If you have not backed up via Mackup yet, then run `mackup backup` to symlink preferences for a wide collection of apps to your iCloud. If you already had a backup via mackup run `mackup restore` You'\''ll find more info on Mackup here: https://github.com/lra/mackup.'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
