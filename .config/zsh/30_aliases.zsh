if [[ -r "$XDG_CONFIG_HOME"/user/aliases ]]; then
    source "$XDG_CONFIG_HOME"/user/aliases
fi

alias -g L='|& less -XR'
alias -g G='| \grep --color=always'
alias -g S='| sed'
alias -g X='| xargs'

if which bat &> /dev/null && which cachef &> /dev/null; then
    alias b='(){cachef $@; bat $@}'
fi

if which xclip &> /dev/null; then
    alias -g C='| xclip -selection c'
    alias p='print -z $(xclip -o -selection c)'
fi

if which rg &> /dev/null; then
    alias -g R='| rg'
fi

if which cachef &> /dev/null; then
    alias v='(){cachef $@; vim --servername HOGE --remote $@}'
fi

if which cachef &> /dev/null; then
    alias e='(){cachef $@; emacsclient -n $@}'
fi

if declare -f cd-gitroot > /dev/null; then
    alias gr='cd-gitroot'
fi
