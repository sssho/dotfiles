if [[ -r ~/.aliases ]]; then
    source ~/.aliases
fi

alias -g L='|& less -XR'
alias -g G='| \grep --color=always'
alias -g S='| sed'
alias -g X='| xargs'

if which bat &> /dev/null; then
    alias -g B='| bat'
fi

if which xclip &> /dev/null; then
    alias -g C='| xclip -selection c'
    alias p='print -z $(xclip -o -selection c)'
fi

if which rg &> /dev/null; then
    alias -g R='| rg'
fi
