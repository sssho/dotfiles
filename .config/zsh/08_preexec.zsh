function _update_display() {
    local display=$(tmux showenv DISPLAY | cut -d '=' -f2)
    [[ "${display:0:1}" == "-" ]] && return
    [[ "$DISPLAY" != "$display" ]] && export DISPLAY="$display"
}

function _update_ssh_auth_sock() {
    local sshas=$(tmux showenv SSH_AUTH_SOCK | cut -d '=' -f2)
    [[ "${sshas:0:1}" == "-" ]] && return
    [[ "$SSH_AUTH_SOCK" != "$sshas" ]] && export SSH_AUTH_SOCK="$sshas"
}

function _update_display_and_ssh_auth_sock() {
    [[ -z "$TMUX" ]] && return

    _update_display
    _update_ssh_auth_sock
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _update_display_and_ssh_auth_sock
