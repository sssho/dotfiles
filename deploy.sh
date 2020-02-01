#!/usr/bin/env bash

targets=".aliases
.bash_profile
.bashrc
.clang-format
.ctags
.dir_colors
.editorconfig
.emacs.d
.exports
.flake8
.gitconfig
.globalrc
.inputrc
.lesskey
.screenrc
.tmux.conf
.vim
.zsh
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

# Install following apps manually
# fzf
# fd
# fzf.vim
# colordiff
# xclip
# vim with python3
