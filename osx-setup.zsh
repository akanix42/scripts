-setup_osx() {
  _osx_enable_terminal_touch_id
}

_osx_enable_terminal_touch_id() {
  (
  set -euo pipefail
  output=$(
    cat /etc/pam.d/sudo \
      | perl -ne 'if ($. == 2) { print "auth sufficient pam_tid.so\n"; }; print;' \
      | column -t
  )
  echo "${output}" | sudo tee /etc/pam.d/sudo >/dev/null
  )
}
