[ -f "$XDG_CONFIG_HOME"/fzf/fzf.zsh ] && source "$XDG_CONFIG_HOME"/fzf/fzf.zsh

# Functions using fzf
# https://github.com/junegunn/fzf

if ! which fzf &> /dev/null; then
    return 1
fi

if which fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd -H -L'
fi

function fzf_select_tmux_pane() {
    local selected=$(tmux list-panes -s -F '#{window_index} #{pane_index} #{pane_current_path}' | fzf --no-sort)

    local window_id  pane_id  _

    [ -z "$selected" ] && return 0

    read window_id pane_id _ <<<"$selected"

    tmux select-window -t $window_id; tmux select-pane -t $pane_id
}
alias td='fzf_select_tmux_pane'

function fzf_select_cache_file() {
    if ! which cachef &> /dev/null; then
        return 0
    fi

    local cachefile=$(cachef --cache-file)
    local selected=$(fzf --tac --no-sort < $cachefile)

    [ -z "$selected" ] && return 0

    print -z -- "$selected"
}
alias ca='fzf_select_cache_file'

function fzf_generic_filter() {
    local selected=$(fzf < /dev/stdin)

    [ -z "$selected" ] && return 0

    print -z -- "$selected"
}
alias -g F='|fzf_generic_filter'

function fzf_select_rg_result() {
    local selected
    local dst

    selected=$(rg --hidden --no-heading --color always "$@" | fzf --no-sort --ansi)

    [ -z "$selected" ] && return 0

    dst=$(echo "$selected" | awk -F: '{print $1}')
    print -z "$dst"
}
alias rgf='fzf_select_rg_result'

# Go to any directory visited before
function fzf_select_cdr_and_cd() {
    local selected=$(cdr -l | awk '{print $2}' | \
                fzf --no-sort --prompt="Select dir> ")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias goto='fzf_select_cdr_and_cd'

# Go to project directory
function fzf_select_projdir_and_cd() {
    [ -r "$XDG_CONFIG_HOME"/user/projdirs ] || return 0

    local selected=$(cat "$XDG_CONFIG_HOME"/user/projdirs | fzf --prompt="Select project dir> ")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias pgo='fzf_select_projdir_and_cd'

# Go to another running shell's work directory
function fzf_select_pgrep_and_cd() {
    local selected=$(
        pgrep -u $USER zsh | \
        sed -e 's|^|/proc/|' -e 's|$|/cwd|' | \
        xargs -L 1 ls -l | awk '{print $11}' | \
        sort | uniq | \
        fzf --prompt="Select working dir> ")

    [ -z "$selected" ] && return 0

    local dst=$(eval readlink -e "$selected")

    [ -d "$dst" ] || return 1

    cd "$dst"
}
alias sgo='fzf_select_pgrep_and_cd'

# Select python virtual env
function fzf_select_python_venv() {
    [ -f "$XDG_CONFIG_HOME"/user/pyenvs ] || return 0

    local selected=$(cat "$XDG_CONFIG_HOME"/user/pyenvs | fzf --no-sort --prompt="Select python venv> ")

    [ -z "$selected" ] && return 0

    local pyenv=$(eval echo "${selected}")

    if [ -f "$pyenv" ] || return 1

    if which deactivate &> /dev/null; then
        deactivate
    fi

    echo "source $pyenv"
    source "$pyenv"
}
alias pysel='fzf_select_python_venv'

# Select git add target files by fzf
function fzf_select_gitadd_target_files() {
    local selected=$(git status -s | fzf -m --no-sort)

    [ -z "$selected" ] && return 0

    local target_files=$(echo "$selected" | awk '{print $2}' | tr '\n' ' ')

    echo "git add $target_files"
    git add ${=target_files}
}
alias a='fzf_select_gitadd_target_files'

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
