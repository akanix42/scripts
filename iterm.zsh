newtabi(){
    # -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
  osascript \
    -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
    -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${*}\""
}
newtabi2(){
    # -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
  osascript \
    -e 'tell application "iTerm2" to tell current window to create tab with default profile command \"echo hi\"'
    # \"echo hi\"'
    # -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${*}\""
}

newpanev(){
  newpane vertically "$@"
}

newpaneh(){
  newpane horizontally "$@"
}

newpane() {
  local direction="$1";
  shift
  osascript \
    -e 'tell application "iTerm2" to tell current window to set newWindow to current tab' \
    -e 'tell application "iTerm2" to tell current session of newWindow to set newPane to (split '"${direction}"' with default profile)' \
    -e 'tell application "iTerm2" to tell newPane to write text "'"${*}"'"'
}
