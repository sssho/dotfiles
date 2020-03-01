if [[ -r ~/.bashrc ]]; then
    # shellcheck source=/dev/null
    source ~/.bashrc
fi

export PATH=$HOME/local/bin:$PATH

# Enviroment Variables
if [[ -r "$HOME/.config/$USER/exports" ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.config/$USER/exports"
fi
