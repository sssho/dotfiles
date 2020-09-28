# See https://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
autoload -Uz colors; colors

function zle-keymap-select zle-line-init zle-line-finish
{
    local mode
    case $KEYMAP in
        main|viins)
            mode="%{$fg[blue]%}{I}%{$reset_color%}"
            ;;
        vicmd)
            mode="%{$fg[magenta]%}{N}%{$reset_color%}"
            ;;
    esac
    # https://unix.stackexchange.com/questions/369847/how-to-configure-zsh-prompt-so-that-its-length-is-proportional-to-terminal-width
    local width=$(( ${COLUMNS:-90} * 70 / 100 ))
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PROMPT="%(?.%{${fg[yellow]}%}.%{${fg[red]}%})%n@%m{%?}%{${color_end}%}$mode %{$fg[cyan]%}%${width}<..<%~%<<%{${reset_color}%}
%# "
    zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
