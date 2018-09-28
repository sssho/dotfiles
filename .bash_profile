if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$HOME/local/bin:$PATH

# Enviroment Variables
if [ -f ~/.exports ]; then
    source ~/.exports
fi
