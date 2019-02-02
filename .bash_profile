if [[ -r ~/.bashrc ]]; then
    source ~/.bashrc
fi

export PATH=$HOME/local/bin:$PATH

# Enviroment Variables
if [[ -r ~/.exports ]]; then
    source ~/.exports
fi
