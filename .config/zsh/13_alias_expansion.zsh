if zle -l | grep -q autosuggest-clear; then
    _expand_alias_insert() {
       zle _expand_alias
       LBUFFER=${LBUFFER##\\}
       LBUFFER=${LBUFFER%% }
       zle autosuggest-clear
       zle self-insert
    }
else
    _expand_alias_insert() {
       zle _expand_alias
       zle self-insert
    }
fi

zle -N _expand_alias_insert

_expand_alias_accept() {
   zle _expand_alias
   zle accept-line
}
zle -N _expand_alias_accept

# space expands all aliases
bindkey -M emacs " " _expand_alias_insert
bindkey -M viins " " _expand_alias_insert

# enter expands aliases
bindkey -M emacs "^M" _expand_alias_accept
bindkey -M viins "^M" _expand_alias_accept

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space
