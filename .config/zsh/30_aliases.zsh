if [[ -r "$XDG_CONFIG_HOME"/user/aliases ]]; then
    source "$XDG_CONFIG_HOME"/user/aliases
fi

alias -g A="| awk '{ print }'"
alias -g L='|& less'
alias -g G='| grep --color=always'
alias -g S="| sed -e 's///g'"
alias -g X='| xargs'
alias -g H='--help | less'

if which bat &> /dev/null && which cachef &> /dev/null; then
    _bat_with_cachef() {
        cachef $@
        bat $@
    }
    alias b='_bat_with_cachef'
fi

if which xclip &> /dev/null; then
    alias -g C='| xclip -selection c'
    alias p='print -z $(xclip -o -selection c)'
fi

if which rg &> /dev/null; then
    alias -g R='| rg -i'
fi

if which cachef &> /dev/null; then
    _vim_with_cachef() {
        cachef $@
        vim --servername HOGE --remote $@
    }
    alias v='_vim_with_cachef'
fi

if which cachef &> /dev/null; then
    _emacs_with_cachef() {
        cachef $@
        emacsclient -n $@
    }
    alias e='_emacs_with_cachef'
fi

if declare -f cd-gitroot > /dev/null; then
    alias gr='cd-gitroot'
fi
