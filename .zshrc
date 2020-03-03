# https://github.com/zplug/zplug
if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.config/$USER/zsh/zplug.zsh
    source ~/.zplug/init.zsh

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

if [[ -r "$HOME/.config/$USER/zshrc.local" ]]; then
    source "$HOME/.config/$USER/zshrc.local"
fi

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
