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

# Neovim
export PATH="$PATH:/opt/nvim-linux64/bin"
# Use Neovim as "preferred editor"
export VISUAL=nvim
# Use Neovim instead of Vim or Vi
alias vim=nvim
alias vi=nvim

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

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Automatically activate the virtual environment when you enter the project
# function auto_poetry_activate() {
#   if [[ -f "pyproject.toml" && -d ".venv" ]]; then
#     eval $(poetry env activate)
#   fi
# }
# autoload -U add-zsh-hook
# add-zsh-hook chpwd auto_poetry_activate
# auto_poetry_activate
