if [[ -r /etc/bashrc ]]; then
    source /etc/bashrc
fi

if [[ -r "$XDG_CONFIG_HOME/user/aliases" ]]; then
    # shellcheck source=/dev/null
    source "$XDG_CONFIG_HOME/user/aliases"
fi

if [[ -t 0 ]]; then
    # Disable C-s and C-q
    stty stop undef

    # Disable C-w
    stty werase undef

    # Enable C-w for killing the word behind point to previous '/'
    bind '"\C-w": unix-filename-rubout'
fi

export PS1="\[\e[36m\]\u@\h \W \[\e[0m\]\\$ "

HISTCONTROL=ignoredups
HISTIGNORE=ls

# https://github.com/junegunn/fzf
if which fzf &> /dev/null; then
    eval "$(fzf --bash)"
fi
