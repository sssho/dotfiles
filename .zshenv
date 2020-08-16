if [[ -r "$HOME"/.config/user/exports ]]; then
    source "$HOME"/.config/user/exports
else
    echo "exports must be read to set some important env variables!" 1>&2
    return 1
fi

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

if [[ -r "$ZDOTDIR"/.zshenv ]]; then
    source "$ZDOTDIR"/.zshenv
fi
