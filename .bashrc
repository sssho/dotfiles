if [[ -r /etc/bashrc ]]; then
    source /etc/bashrc
fi

if [[ -r ~/.aliases ]]; then
    source ~/.aliases
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
