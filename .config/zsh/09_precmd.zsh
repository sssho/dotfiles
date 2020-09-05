autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "%F{green}[%b]%f"

function _update_vcs_info_msg() {
    vcs_info

    RPROMPT="${vcs_info_msg_0_}"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg
