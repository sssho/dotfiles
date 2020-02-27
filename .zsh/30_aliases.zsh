if [[ -r ~/.aliases ]]; then
    source ~/.aliases
fi

alias f='ls -1 *(.)'
alias fl='ls -l1 *(.)'
alias d='ls -d1 *(/)'
alias dl='ls -dl1 *(/)'

alias -g L='|& less -XR'
alias -g G='| \grep --color=always'
alias -g S='| sed'
alias -g X='| xargs'

if which xclip &> /dev/null; then
    alias -g C='| xclip -selection c'
    alias puts='print -z $(xclip -o -selection c)'
fi

if which rg &> /dev/null; then
    alias -g R='| rg'
fi
