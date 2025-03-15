# Prevents multiple additions
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    you-should-use
    poetry
    zsh-navigation-tools
    zsh-syntax-highlighting # After zsh-autosuggestions to avoid conflict
)

source $ZSH/oh-my-zsh.sh

# Tokyo Night colors for zsh-syntax-highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89'
ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#bb9af7'
ZSH_HIGHLIGHT_STYLES[path]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#e0af68'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=#ff9e64'
ZSH_HIGHLIGHT_STYLES[function]='fg=#9ece6a'

# Zoxide
eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Neovim
# export PATH="$PATH:/opt/nvim-linux64/bin"
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
export PATH="$HOME/go/bin:$PATH"
# Golang (only for linux installs)
export PATH="/usr/local/go/bin:$PATH"

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

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# OpenJDK
# 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"'
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

#Automatically activate the virtual environment when you enter the project
# function auto_poetry_activate() {
#   if [[ -f "pyproject.toml" && -d ".venv" ]]; then
#     eval $(poetry env activate)
#   fi
# }
# autoload -U add-zsh-hook
# add-zsh-hook chpwd auto_poetry_activate
# auto_poetry_activate
