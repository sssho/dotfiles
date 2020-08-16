export PATH=$HOME/local/bin:$PATH

# Enviroment Variables
if [[ -r "$HOME"/.config/user/exports ]]; then
    # shellcheck source=/dev/null
    source "$HOME"/.config/user/exports
else
    echo "exports must be read to set some important env variables!" 1>&2
    return 1
fi

if [[ -r ~/.bashrc ]]; then
    # shellcheck source=/dev/null
    source ~/.bashrc
fi
