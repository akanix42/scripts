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
