#!/usr/bin/env bash

source exports

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p "$XDG_CONFIG_HOME"
[ ! -d "$XDG_DATA_HOME" ] && mkdir -p "$XDG_DATA_HOME"
[ ! -d "$XDG_CACHE_HOME" ] && mkdir -p "$XDG_CACHE_HOME"

readonly targets=".bash_profile
.bashrc
.editorconfig
.vim
.zshenv"

readonly here=$(pwd)

for target in $targets; do
    original="$HOME"/"$target"

    if [[ -e "$original" ]]; then
        echo remove "$original"
        rm -rf "$original"
    fi

    ln -s "$here"/"$target" "$HOME"/"$target"
done

readonly xdgtargets="/dircolors
git/config
readline/inputrc
screen/screenrc
tmux/tmux.conf
zsh/.zshrc
/flake8"

for target in $xdgtargets; do
    dstdir="$XDG_CONFIG_HOME"/$(cut -d "/" -f1 <<<"$target")
    [ ! -d "$dstdir" ] && mkdir -p "$dstdir"

    dst="$XDG_CONFIG_HOME"/"$target"

    if [ -f "$dst" ]; then
        echo remove "$dst"
        rm -f "$dst"
    fi

    src="$here"/.config/"$target"

    ln -sf "$src" "$dst"
done

readonly usertargets="aliases
exports
zsh"

[ ! -d "$XDG_CONFIG_HOME"/"$USER" ] && mkdir -p "$XDG_CONFIG_HOME"/"$USER"

for target in $usertargets; do
    original="$XDG_CONFIG_HOME"/"$USER"/"$target"

    ln -fs "$here"/"$target" "$original"
done
