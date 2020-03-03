if [[ -r /etc/bashrc ]]; then
    source /etc/bashrc
fi

if [[ -r "$HOME/.config/$USER/aliases" ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.config/$USER/aliases"
fi

# Disable C-s and C-q
stty stop undef

# Disable C-w
stty werase undef

# Enable C-w for killing the word behind point to previous '/'
bind '"\C-w": unix-filename-rubout'

export PS1="\[\e[36m\]\u@\h \W \[\e[0m\]\\$ "

export HISTCONTROL=ignoredups
export HISTIGNORE=ls

# shellcheck source=/dev/null
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash
