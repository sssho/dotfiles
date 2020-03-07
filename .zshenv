if [[ -r "$HOME/.config/$USER/exports" ]]; then
    source "$HOME/.config/$USER/exports"
else
    echo "exports must be read to set some important env variables!" 1>&2
    return 1
fi

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [[ -r "$ZDOTDIR"/.zshenv ]]; then
    source "$ZDOTDIR"/.zshenv
fi
