# https://github.com/zdharma/zinit
if [[ -f "$XDG_DATA_HOME"/zinit/bin/zinit.zsh ]]; then
    declare -A ZINIT
    ZINIT[BIN_DIR]="$XDG_DATA_HOME"/zinit/bin
    ZINIT[HOME_DIR]="$XDG_DATA_HOME"/zinit
    ZINIT[PLUGINS_DIR]="$XDG_DATA_HOME"/zinit/plugins
    ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zinit/.zcompdump

    source "$XDG_DATA_HOME"/zinit/bin/zinit.zsh
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    zinit light zsh-users/zsh-autosuggestions
    zinit light zdharma/fast-syntax-highlighting
    zinit light mollifier/cd-gitroot

    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"
fi

# Source personal settings
for f in "$XDG_CONFIG_HOME"/zsh/<->_*.zsh; do
    source "$f"
done
