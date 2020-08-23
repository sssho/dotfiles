# Use emacs style
bindkey -e

bindkey "^j^j" vi-cmd-mode

# Disable not used default keys
bindkey -r "^O"
bindkey -r "^Q"
bindkey -r "^S"
bindkey -r "^T"
bindkey -r "^V"

bindkey "^I" menu-complete

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
