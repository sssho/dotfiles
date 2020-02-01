# Functions using fzf
# https://github.com/junegunn/fzf

if ! which fzf &> /dev/null; then
    return 1
fi

function fzf_select_history() {
    BUFFER=$(fc -l -n 1 | awk '!a[$0]++' | fzf --tac --no-sort --prompt "history> ")
    CURSOR=$#BUFFER # move cursor to end of buffer
    zle reset-prompt
}

zle -N fzf_select_history
bindkey '^R' fzf_select_history

function generic_filter() {
    local selected

    selected=$(fzf < /dev/stdin)

    if [ -n "$selected" ]; then
        print -z -- "$selected"
    fi
}
alias -g F='|generic_filter'

function agf() {
    local selected
    local dst

    selected=$(ag --noheading --nobreak --nonumbers $@ | fzf --ansi)

    if [ -n "$selected" ]; then
        dst=$(echo "$selected" | awk -F: '{print $1}')
        print -z "$dst"
    fi
}

function goto() {
    local dst=$(cdr -l | awk '{ print $2 }' | \
                fzf --no-sort --prompt='Where do you go?> ')

    if [ -n "$dst" ]; then
        cd $(eval echo $dst)
    fi
}

function pysel() {
    if [[ ! -f ~/.pyenvs ]]; then
        return 1
    fi

    local pyenv=$(cat ~/.pyenvs | fzf --prompt="Which python??> ")
    local pyenv2=$(eval echo "${pyenv}")

    if [ -f "$pyenv2" ]; then
        if which deactivate &> /dev/null; then
            deactivate
        fi
        echo "source $pyenv2"
        source "$pyenv2"
    fi
}

function sgo() {
    local dst=$(pgrep zsh | \
                sed -e 's|^|/proc/|' -e 's|$|/cwd|' | \
                xargs -L 1 ls -l | awk '{print $11}' | \
                fzf --prompt='Working directories> ')

    if [ -n "$dst" ]; then
        cd "$dst"
    fi
}

_gen_fzf_default_opts() {
    local base03="234"
    local base02="235"
    local base01="240"
    local base00="241"
    local base0="244"
    local base1="245"
    local base2="254"
    local base3="230"
    local yellow="136"
    local orange="166"
    local red="160"
    local magenta="125"
    local violet="61"
    local blue="33"
    local cyan="37"
    local green="64"

    # Comment and uncomment below for the light theme.

    # Solarized Dark color scheme for fzf
    export FZF_DEFAULT_OPTS=" \
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue \
    --color info:$yellow,prompt:$blue,pointer:$orange,marker:$base3,spinner:$yellow,header:$yellow \
    --height 50% --exact --reverse"
}
_gen_fzf_default_opts
