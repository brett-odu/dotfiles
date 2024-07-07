#!/bin/bash

# Load configuration and secrets
source ~/dotfiles/config.sh
source ~/dotfiles/secrets.sh

# Install Oh My Zsh
if [ "$INSTALL_OH_MY_ZSH" = true ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Ensure the custom directory is set
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Install zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Install Powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# Install Vim-Plug for Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Define the absolute path to the dotfiles directory
DOTFILES_DIR=~/dotfiles

# Symlink dotfiles
ln -sf ${DOTFILES_DIR}/.config/zsh/.zshrc ~/.zshrc
ln -sf ${DOTFILES_DIR}/.config/wezterm ~/.config/wezterm
ln -sf ${DOTFILES_DIR}/.config/starship.toml ~/.config/starship.toml
ln -sf ${DOTFILES_DIR}/.config/nvim ~/.config/nvim
ln -sf ${DOTFILES_DIR}/.config/tmux/.tmux.conf ~/.tmux.conf

# Ensure Starship is initialized in .zshrc
if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# Source the zsh configuration
exec zsh -l

echo "Dotfiles setup complete!"

# Open Neovim and install plugins
nvim +PlugInstall +qall

echo "Neovim plugins installed!"

