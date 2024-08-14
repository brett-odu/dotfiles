# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Add your plugins here
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias ll='ls -lah'

# Bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}


# Add Neovim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Initialize starship prompt
eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
