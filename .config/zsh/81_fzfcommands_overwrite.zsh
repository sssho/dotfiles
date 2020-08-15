# Use fd instead of find

if ! which fd &> /dev/null; then
  return
fi

__fd_exclude="-E '.git' -E '.svn' -E '__pycache__'"
_fzf_compgen_path() {
  echo "$1"
  fd "$__fd_exclude" -L -H . "$1"
}

_fzf_compgen_dir() {
  fd "$__fd_exclude" -L -H -t d . "$1"
}

export FZF_CTRL_T_COMMAND="command fd $__fd_exclude -H -L -d 5"

bindkey -r '^T'
bindkey '^O' fzf-file-widget

# Enable ## and @@
_fzf_cachef_completion() {
  if ! which cachef &> /dev/null; then
    return 0
  fi

  local cachefile=$(cachef --cache-file)
  local selected=$(fzf --tac --no-sort < $cachefile)

  [ -z "$selected" ] && selected=""

  LBUFFER="$lbuf$selected"

  zle reset-prompt
}

_fzf_tmux_completion() {
  if ! which tmuxcomplete &> /dev/null; then
    return 0
  fi

  local selected=$(tmuxcomplete -l '-s' | fzf --no-sort)

  [ -z "$selected" ] && selected=""

  LBUFFER="$lbuf$selected"

  zle reset-prompt
}

# Hack
fzf-completion-custom() {
  local tokens cmd prefix trigger tail matches lbuf d_cmds
  setopt localoptions noshwordsplit noksh_arrays noposixbuiltins

  # http://zsh.sourceforge.net/FAQ/zshfaq03.html
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
  tokens=(${(z)LBUFFER})
  if [ ${#tokens} -lt 1 ]; then
    zle ${fzf_default_completion:-expand-or-complete}
    return
  fi

  cmd=$(__fzf_extract_command "$LBUFFER")

  # Explicitly allow for empty trigger.
  trigger=${FZF_COMPLETION_TRIGGER-'**'}
  [ -z "$trigger" -a ${LBUFFER[-1]} = ' ' ] && tokens+=("")

  # When the trigger starts with ';', it becomes a separate token
  if [[ ${LBUFFER} = *"${tokens[-2]}${tokens[-1]}" ]]; then
    tokens[-2]="${tokens[-2]}${tokens[-1]}"
    tokens=(${tokens[0,-2]})
  fi

  lbuf=$LBUFFER
  tail=${LBUFFER:$(( ${#LBUFFER} - ${#trigger} ))}
  # Kill completion (do not require trigger sequence)
  if [ "$cmd" = kill -a ${LBUFFER[-1]} = ' ' ]; then
    tail=$trigger
    tokens+=$trigger
    lbuf="$lbuf$trigger"
  fi

  # Trigger sequence given
  if [ ${#tokens} -gt 1 -a "$tail" = "$trigger" ]; then
    d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})

    [ -z "$trigger"      ] && prefix=${tokens[-1]} || prefix=${tokens[-1]:0:-${#trigger}}
    [ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}}

    if eval "type _fzf_complete_${cmd} > /dev/null"; then
      prefix="$prefix" eval _fzf_complete_${cmd} ${(q)lbuf}
    elif [ ${d_cmds[(i)$cmd]} -le ${#d_cmds} ]; then
      _fzf_dir_completion "$prefix" "$lbuf"
    else
      _fzf_path_completion "$prefix" "$lbuf"
    fi
  elif [ ${#tokens} -gt 1 -a "$tail" = "##" ]; then
    [ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}}

    _fzf_cachef_completion "$lbuf"
  elif [ ${#tokens} -gt 1 -a "$tail" = "@@" ]; then
    [ -n "${tokens[-1]}" ] && lbuf=${lbuf:0:-${#tokens[-1]}}

    _fzf_tmux_completion "$lbuf"
  # Fall back to default completion
  else
    zle ${fzf_default_completion:-expand-or-complete}
  fi
}
zle     -N   fzf-completion-custom
bindkey -r '^I'
bindkey '^I' fzf-completion-custom
