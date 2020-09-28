# Disable Ctrl-D logout
setopt ignoreeof

# Disable > for existing file. Use >| instead.
# Disable >> for non existing file. Use > instead.
setopt noclobber

# Enable completion even after =. e.g. --prefix=hoge
setopt magic_equal_subst

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups

# Do not enter command lines into the history list if they are duplicates
# of the previous event.
setopt hist_ignore_dups

# Do not add a command that following space
setopt hist_ignore_space

# Do not add 'history' commnad itself to history
setopt hist_no_store

# Enable sharing command history among tabs, cosoles
setopt share_history

# Enable cd without typing cd
setopt auto_cd

# Disable adding duplicated directory to directory stack
setopt pushd_ignore_dups

# Disable ctrl-s/ctrl-q for flow control
setopt no_flow_control

# Disable beep
setopt no_beep

# Allow comment in command line
setopt interactive_comments
