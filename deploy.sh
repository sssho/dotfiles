#!/usr/bin/env bash

source ./.config/user/exports

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p "$XDG_CONFIG_HOME"
[ ! -d "$XDG_DATA_HOME" ] && mkdir -p "$XDG_DATA_HOME"
[ ! -d "$XDG_CACHE_HOME" ] && mkdir -p "$XDG_CACHE_HOME"

readonly targets=".bash_profile
.bashrc
.editorconfig
.vim
.zshenv"

readonly here=$(pwd)

function update_symlink() {
    local src="$1"
    local dst="$2"

    if [[ ! -e "$dst" || -L "$dst" ]]; then
        echo update symlink "$dst"
        ln -sf "$src" "$(dirname "$dst")"
    elif [[ -e "$dst" ]]; then
        echo skip "$dst"
    fi
}

for target in $targets; do
    src="$here"/"$target"
    dst="$HOME"/"$target"

    update_symlink "$src" "$dst"
done

for target in $(find .config -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 -L 1 basename); do
    src="$here"/.config/"$target"
    dst="$XDG_CONFIG_HOME"/"$target"

    update_symlink "$src" "$dst"
done

for target in $(find .config -mindepth 1 -maxdepth 1 -type f -print0 | xargs -0 -L 1 basename); do
    src="$here"/.config/"$target"
    dst="$XDG_CONFIG_HOME"/"$target"

    update_symlink "$src" "$dst"
done
