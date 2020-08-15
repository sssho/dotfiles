# ??
zstyle ':completion:*' menu select=2

# https://gihyo.jp/dev/serial/01/zsh-book/0005
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# ??
zstyle ':completion:*' format '%B%d%b'

# Use LS_COLORS for completion
zstyle ':completion:*:default' list-colors "$LS_COLORS"

# ??
zstyle ':completion:*' completer _complete _match _expand _prefix

# ??
zstyle ':completion:*' verbose yes

# For cdr
if [[ ! -d ~/.cache/shell ]]; then
    mkdir -p ~/.cache/shell
fi

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file ~/.cache/shell/chpwd-recent-dirs
