#!/bin/bash

# Load configuration and secrets
source ~/dotfiles/config.sh
source ~/dotfiles/secrets.sh

# Install Oh My Zsh
if [ "$INSTALL_OH_MY_ZSH" = true ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k
if [ "$INSTALL_POWERLEVEL10K" = true ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install Oh My Zsh plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Symlink dotfiles
ln -sf ~/dotfiles/.config/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/wezterm ~/.config/wezterm
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/.config/tmux/.tmux.conf ~/.tmux.conf

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

