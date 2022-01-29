# Setup fzf
if [[ ! -d "${XDG_DATA_HOME}/fzf" ]]; then
  return
fi

# ---------
if [[ ! "$PATH" == *"${XDG_DATA_HOME}/fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}${XDG_DATA_HOME}/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_DATA_HOME}/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${XDG_DATA_HOME}/fzf/shell/key-bindings.zsh"
