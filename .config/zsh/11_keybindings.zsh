# Use emacs style
bindkey -e

# Disable not used keys
# bindkey -r "^J"
bindkey -r "^O" # use for screen/tmux
bindkey -r "^Q"
bindkey -r "^S"
bindkey -r "^T"
bindkey -r "^V"

bindkey "^I" menu-complete
# bindkey "^I" menu-expand-or-complete

function _back_to_space() {
    zle vi-backward-blank-word
}

zle -N _back_to_space
bindkey '^Xb' _back_to_space

function _forward_to_space() {
    zle vi-forward-blank-word
}

zle -N _forward_to_space
bindkey '^Xf' _forward_to_space
