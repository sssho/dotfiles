# Enable completion even after =. e.g. --prefix=hoge
setopt magic_equal_subst

# Delete the older command
# setopt hist_ignore_all_dups

# Do not add a command that already in the history
setopt hist_ignore_dups

# Do not add a command that following space
setopt hist_ignore_space

# Do not add 'history' commnad itself to history
setopt hist_no_store

# Enable sharing command history among tabs, cosoles
setopt share_history

# Enable cd without typing cd
setopt auto_cd

#
# setopt auto_pushd

# Disable adding duplicated directory to directory stack
setopt pushd_ignore_dups

# Disable ctrl-s/ctrl-q for flow control
setopt no_flow_control

# Disable beep
setopt no_beep
