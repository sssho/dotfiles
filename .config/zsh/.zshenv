typeset -gx -U path

path=(~/local/bin(N-/) \
      ~/local/go/bin(N-/) \
      "$path[@]")

typeset -gx -U fpath

fpath=("$ZDOTDIR"/completion(N-/) $fpath)

[[ ! -d "$XDG_CACHE_HOME"/zsh ]] && mkdir -p "$XDG_CACHE_HOME"/zsh

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump

# History
export HISTFILE="$XDG_CACHE_HOME"/zsh/history
export HISTSIZE=10000000
export SAVEHIST="$HISTSIZE"

# Use '/' as delimitor when backward-kill-word
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if [[ -r "$ZDOTDIR"/zshenv.local ]]; then
    source "$ZDOTDIR"/zshenv.local
fi
