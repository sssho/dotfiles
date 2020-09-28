if [[ -f "$XDG_CONFIG_HOME"/fzf/fzf.zsh ]]; then
    source "$XDG_CONFIG_HOME"/fzf/fzf.zsh
else
    return
fi

# Functions using fzf
# https://github.com/junegunn/fzf

if ! which fzf &> /dev/null; then
    return 1
fi

if which fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd -H -L'
fi

function _tmux_popup_available() {
    [[ -z "$TMUX" || -z "$TMUX_VERSION" ]] && return 1
    # remove version attribute such as 'a', 'b', 'rc-1' etc
    [[ "${TMUX_VERSION:0:3}" > 3.1 ]]
}

# Use popup if available
_tmux_popup_available && export FZF_TMUX_OPTS="-p"

function fzf_cachef_list() {
    if ! which cachef &> /dev/null; then
        return 0
    fi

    local cachefile=$(cachef --cache-file)
    local selected=$($(__fzfcmd) --tac < $cachefile)

    [ -z "$selected" ] && return 0

    print -z -- "$selected"
}
alias ca='fzf_cachef_list'

function fzf_generic_filter() {
    local selected=$($(__fzfcmd) < /dev/stdin)

    [ -z "$selected" ] && return 0

    print -z -- "$selected"
}
alias -g F='|fzf_generic_filter'

function fzf_rg_result() {
    local selected
    local dst

    selected=$(rg --hidden --no-heading --color always "$@" | $(__fzfcmd) --no-sort --ansi)

    [ -z "$selected" ] && return 0

    dst=$(echo "$selected" | awk -F: '{print $1}')
    print -z "$dst"
}
alias rgf='fzf_rg_result'

# Go to any directory visited before
function fzf_cd_history() {
    local selected=$(export FZF_TMUX_OPTS="${FZF_TMUX_OPTS:+-p 80%,80%}"; cdr -l | \
        awk '{print $2}' | \
        $(__fzfcmd) --no-sort --prompt="Select dir>")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias goto='fzf_cd_history'

# Go to project directory
function fzf_cd_projdir() {
    [ -r "$XDG_CONFIG_HOME"/user/projdirs ] || return 0

    local selected=$(cat "$XDG_CONFIG_HOME"/user/projdirs | \
        $(__fzfcmd) --prompt="Select project dir> ")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias pgo='fzf_cd_projdir'

# Go to another running shell's work directory
function fzf_cd_another_shell() {
    local selected=$(
        pgrep -u $USER zsh | \
        sed -e 's|^|/proc/|' -e 's|$|/cwd|' | \
        xargs -L 1 ls -l | awk '{print $11}' | \
        sort | uniq | \
        $(__fzfcmd) --prompt="Select working dir> ")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias sgo='fzf_cd_another_shell'

# Select python virtual env
function fzf_activate_pyenv() {
    [ -f "$XDG_CONFIG_HOME"/user/pyenvs ] || return 0

    local selected=$(cat "$XDG_CONFIG_HOME"/user/pyenvs | $(__fzfcmd) --no-sort --prompt="Select python venv> ")

    [ -z "$selected" ] && return 0

    local pyenv=$(eval echo "${selected}")

    if [ -f "$pyenv" ] || return 1

    if which deactivate &> /dev/null; then
        deactivate
    fi

    echo "source $pyenv"
    source "$pyenv"
}
alias pysel='fzf_activate_pyenv'

# Select git add target files by fzf
function fzf_git_add() {
    local selected=$(git status -s | $(__fzfcmd) -m --no-sort)

    [ -z "$selected" ] && return 0

    local target_files=$(echo "$selected" | awk '{print $2}' | tr '\n' ' ')

    echo "git add $target_files"
    git add ${=target_files}
}
alias a='fzf_git_add'

if which cheat &> /dev/null; then
    function fzf_cheat() {
        local selected=$(cheat -l | tail -n +2 | cut -d ' ' -f1 | $(__fzfcmd))

        [ -z "$selected" ] && return 0

        cheat "$selected"
    }
    alias ct="fzf_cheat"
fi

function fzf_switch_tags() {
    [[ ! -d "$XDG_CACHE_HOME"/tags ]] && return 1
    local selected=$(find "$XDG_CACHE_HOME"/tags -type f | $(__fzfcmd))

    [[ -z "$selected" ]] && return 0

    ln -sf "$selected" "$XDG_CACHE_HOME"/tags/tags
}
alias tsel="fzf_switch_tags"

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
