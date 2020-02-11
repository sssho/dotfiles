typeset -gx -U path

path=(~/local/bin(N-) \
      ~/local/go/bin \
      "$path[@]")

typeset -gx -U fpath

fpath=(~/.zsh/Completion(N-/)
       $fpath)

# Autoload
autoload -Uz compinit && compinit

# Enviroment Variables
if [[ -f ~/.exports ]]; then
    source ~/.exports
fi

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST="$HISTSIZE"

# Use '/' as delimitor when backward-kill-word
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if [[ -f ~/.zshenv.local ]]; then
    source ~/.zshenv.local
fi
