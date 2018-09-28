if [[ -f ~/.aliases  ]]; then
    source ~/.aliases
fi

if [[ -f ~/.aliases.local  ]]; then
    source ~/.aliases.local
fi

alias f='ls -1 *(.)'
alias fl='ls -l1 *(.)'
alias d='ls -d1 *(/)'
alias dl='ls -dl1 *(/)'

alias -g L='|& less -XR'
alias -g G='| grep'
alias -g S='| sed'
alias -g X='| xargs'
alias -g A='| ag'
