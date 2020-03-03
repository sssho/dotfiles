autoload -Uz vcs_info

precmd () {
    [ -d .git ] || {
        vcs_info_msg_0_=""
        return 0
    }
    vcs_info
}

setopt prompt_subst
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

zstyle ':vcs_info:*' formats "%F{green}[%b]%f"

color_end="%{[0m%}"
PROMPT="%(?.%{%F{yellow}%}.%{%F{red}%})%n@%m {%?} %~ ${color_end}
%# "
