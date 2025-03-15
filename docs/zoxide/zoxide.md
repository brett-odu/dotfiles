# Zoxide Usage Guide

## Overview
Zoxide is a smarter `cd` command that helps you jump between frequently used directories with ease.

## Table of Contents
  - [Basic Usage](#basic-usage)
  - [Interactive Mode](#interactive-mode)
  - [Tab Completion (Bash 4.4+, Fish, Zsh)](#tab-completion-bash-44-fish-zsh)
  - [Resources](#resources)

## Basic Usage
- `z foo` → Jumps to the highest-ranked directory matching `foo`
- `z foo bar` → Jumps to the highest-ranked directory matching `foo` and `bar`
- `z foo /` → Jumps to a subdirectory starting with `foo`
- `z ~/foo` → Works like a regular `cd ~/foo`
- `z foo/` → Moves into a relative path
- `z ..` → Moves one level up
- `z -` → Jumps back to the previous directory

## Interactive Mode
- `zi foo` → Uses `fzf` for an interactive selection of matching directories

## Tab Completion (Bash 4.4+, Fish, Zsh)
- `z foo<SPACE><TAB>` → Shows interactive completions

## Resources
- [Zoxide Algorithm](https://github.com/ajeetdsouza/zoxide/wiki/Algorithm#matching)

