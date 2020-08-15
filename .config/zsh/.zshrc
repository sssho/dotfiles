# https://github.com/zplug/zplug
if [[ -f ~/local/zplug/init.zsh ]]; then
    export ZPLUG_HOME=~/local/zplug
    export ZPLUG_CACHE_DIR="$XDG_CACHE_HOME"/zplug
    export ZPLUG_ERROR_LOG="$XDG_CACHE_HOME"/zplug/error_log
    export ZPLUG_LOADFILE="$XDG_CONFIG_HOME"/zsh/packages.zsh
    source "$ZPLUG_HOME"/init.zsh

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load

    # for solarized dark theme
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=238'
else
    echo "zplug is not installed."
    echo "  check -> https://github.com/zplug/zplug"
fi
