# Zsh Configuration Guide

## Overview

Zsh is an advanced shell with powerful customization options. The `.zshrc` file defines aliases, environment variables, and shell behavior, customized for enhanced productivity and seamless integration with other tools.

## Table of Contents

  - [Aliases](#aliases)
  - [Prompt Customization](#prompt-customization)
  - [Zoxide Integration](#zoxide-integration)
  - [Tmux Integration](#tmux-integration)
  - [Keybindings](#keybindings)
  - [Plugins](#plugins)
  - [Custom Functions](#custom-functions)
  - [Resources](#resources)

## Aliases

Common aliases improve productivity:

```sh
alias ll='ls -lah'
alias gs='git status'
alias gp='git push'
alias ga='git add .'
alias tmux='tmux attach -t main || tmux new -s main'
alias zshconfig='vim ~/.zshrc'
alias reload='source ~/.zshrc'
```

## Prompt Customization



## Zoxide Integration

Zoxide is integrated for quick directory navigation:

```sh
eval "$(zoxide init zsh)"
```

Example usage:
- `z foo` → Jump to the most used directory matching "foo"
- `zi` → Interactive selection of directories

## Tmux Integration



## Keybindings

Custom keybindings for efficiency:

```sh
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^R' fzf-history-widget
```

## Plugins

Zsh plugins enhance usability and efficiency. Managed via `zinit` or `oh-my-zsh`:

- **zsh-autosuggestions** → Suggests commands as you type
- **zsh-syntax-highlighting** → Highlights syntax in real-time
- **fzf** → Fuzzy search through history and files

## Custom Functions

Custom functions to improve workflow:

```sh
mkcd() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
```

## Resources

- [Zsh Line Editor](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets)

