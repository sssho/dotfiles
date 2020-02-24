# Functions using fzf
# https://github.com/junegunn/fzf

if ! which fzf &> /dev/null; then
    return 1
fi

if which fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd -H --exclude ".git" --exclude ".svn" --exclude "__pycache__"'
fi

function generic_filter() {
    local selected

    selected=$(fzf < /dev/stdin)

    if [ -n "$selected" ]; then
        print -z -- "$selected"
    fi
}
alias -g F='|generic_filter'

function rgf() {
    local selected
    local dst

    selected=$(rg --hidden --no-heading --color always "$@" | fzf --no-sort --ansi)

    if [ -n "$selected" ]; then
        dst=$(echo "$selected" | awk -F: '{print $1}')
        print -z "$dst"
    fi
}

# Go to any directory visited before
function goto() {
    local dst_selected=$(cdr -l | awk '{print $2}' | \
                fzf --no-sort --prompt="Select dir> ")
    local dst=$(eval readlink -e "$dst_selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}

# Go to project directory
function pgo() {
    [ -f ~/.projdirs ] || return 1

    local dst_selected=$(cat ~/.projdirs | fzf --prompt="Select project dir> ")
    local dst=$(eval readlink -e "$dst_selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}

# Go to another running shell's work directory
function sgo() {
    local dst_selected=$(
        pgrep zsh | \
        sed -e 's|^|/proc/|' -e 's|$|/cwd|' | \
        xargs -L 1 ls -l | awk '{print $11}' | \
        fzf --prompt="Select working dir> ")
    local dst=$(eval readlink -e "$dst_selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}

# Select python virtual env
function pysel() {
    [ -f ~/.pyenvs ] || return 1

    local pyenv=$(cat ~/.pyenvs | fzf --no-sort --prompt="Select python venv> ")
    local pyenv2=$(eval echo "${pyenv}")

    if [ -f "$pyenv2" ]; then
        if which deactivate &> /dev/null; then
            deactivate
        fi
        echo "source $pyenv2"
        source "$pyenv2"
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
