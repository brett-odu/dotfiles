# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add your plugins here
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias ll='ls -la'

# Add Neovim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Initialize starship prompt
eval "$(starship init zsh)"

