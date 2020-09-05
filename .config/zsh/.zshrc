# https://github.com/zdharma/zinit
if [[ -f "$HOME"/local/zinit/bin/zinit.zsh ]]; then
    declare -A ZINIT
    ZINIT[BIN_DIR]="$HOME"/local/zinit/bin
    ZINIT[HOME_DIR]="$HOME"/local/zinit
    ZINIT[PLUGINS_DIR]="$HOME"/local/zinit/plugins
    ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zinit/.zcompdump

    source "$HOME"/local/zinit/bin/zinit.zsh
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
