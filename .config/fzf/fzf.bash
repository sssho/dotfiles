# Setup fzf
if [[ ! -d "${XDG_DATA_HOME}/fzf" ]]; then
  return
fi

# ---------
if [[ ! "$PATH" == *"$HOME"/local/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${XDG_DATA_HOME}/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_DATA_HOME}/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${XDG_DATA_HOME}/fzf/shell/key-bindings.bash"
