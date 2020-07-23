eval $(thefuck --alias)
alias f="fuck"

# re-source zshrc with the `.` command
function _accept-line() {
    if [[ $BUFFER == "." ]]; then
      BUFFER="source ~/.zshrc"
    fi
    zle .accept-line
}
zle -N accept-line _accept-line

### -----------------------------------
### Fix slowness of pastes with zsh-syntax-highlighting.zsh
_zsh_pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

_zsh_pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init _zsh_pasteinit
zstyle :bracketed-paste-magic paste-finish _zsh_pastefinish
### -----------------------------------
