#!/usr/bin/env bash

targets=".bash_profile
.bashrc
.clang-format
.dir_colors
.editorconfig
.emacs.d
.gitconfig
.globalrc
.inputrc
.lesskey
.screenrc
.tmux.conf
.vim
.zshenv
.zshrc"

here=$(pwd)

for target in $targets; do
    original="$HOME/$target"

    if [[ -e "$original" ]]; then
        echo remove "$original"
        rm -rf "$original"
    fi

    ln -s "$here/$target" "$HOME/$target"
done

[ -d "$HOME/.config/$USER" ] || mkdir -p "$HOME/.config/$USER"

targets2="aliases
exports
zsh"

for target in $targets2; do
    original="$HOME/.config/$USER/$target"

    ln -fs "$here/$target" "$original"
done

ln -fs "$here/flake8" "$HOME/.config/flake8"

# Install following apps manually
# fzf
# fd
# fzf.vim
# colordiff
# xclip
# vim with python3
