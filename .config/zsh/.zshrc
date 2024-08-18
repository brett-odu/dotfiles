export PATH="$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-navigation-tools
    you-should-use
    poetry
)

source $ZSH/oh-my-zsh.sh

# Add Neovim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Initialize starship prompt
eval "$(starship init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Golang
PATH=$PATH:/usr/local/go/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bat
alias cat=bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
