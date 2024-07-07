#!/bin/bash

# Load configuration and secrets
source ~/dotfiles/config.sh
source ~/dotfiles/secrets.sh

# Install Zsh
if [ "$INSTALL_ZSH" = true ]; then
  sudo apt update
  sudo apt install -y zsh
  chsh -s $(which zsh)
  echo "Zsh installed and set as default shell. Please log out and log back in, then run setup.sh to complete the setup."
  exit 0
fi

# Install WezTerm
if [ "$INSTALL_WEZTERM" = true ]; then
  sudo apt update
  sudo apt install -y wget gnupg2 ca-certificates lsb-release
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  sudo apt update
  sudo apt install -y wezterm
fi

# Install JetBrainsMono Nerd Font
if [ "$INSTALL_JETBRAINS_MONO" = true ]; then
  mkdir -p ~/.local/share/fonts
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip" -O JetBrainsMono.zip
  unzip JetBrainsMono.zip -d ~/.local/share/fonts
  fc-cache -fv
  rm JetBrainsMono.zip
fi

# Install Neovim
if [ "$INSTALL_NEOVIM" = true ]; then
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
  tar xzf nvim-linux64.tar.gz
  sudo mv nvim-linux64 /opt/
  echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc
  rm nvim-linux64.tar.gz
fi

# Install Node.js
if [ "$INSTALL_NODEJS" = true ]; then
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
fi

# Install Starship
if [ "$INSTALL_STARSHIP" = true ]; then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
fi

# Install Vim-Plug for Neovim
if [ "$INSTALL_VIM_PLUG" = true ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install GNOME Tweaks
if [ "$INSTALL_GNOME_TWEAKS" = true ]; then
  sudo apt update
  sudo apt install -y gnome-tweaks
fi

# Install Git and configure user.name and user.email
if [ "$INSTALL_GIT" = true ]; then
  sudo apt update
  sudo apt install -y git
  git config --global user.name "$GIT_USER_NAME"
  git config --global user.email "$GIT_USER_EMAIL"
fi

echo "Stage 1 complete! Please log out and log back in, then run setup.sh to complete the setup."

