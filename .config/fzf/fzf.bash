# Setup fzf
if [[ ! -d "${HOME}/local/fzf" ]]; then
  return
fi

# ---------
if [[ ! "$PATH" == *"$HOME"/local/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/local/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/local/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/local/fzf/shell/key-bindings.bash"
