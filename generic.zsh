alias jqr='jq -r'
alias k='kubectl'
alias knifedbs='knife data bag show --secret-file ~/.chef/encrypted_data_bag_secret'
alias kshell='kubectl run --generator=run-pod/v1 areid-shell --rm -i --tty --image akanix42/k8s-shell:latest --image-pull-policy Always -- bash'
alias rm="safe_rm"
alias tf="terraform"
alias tg="terragrunt"
alias yrm="safe_rm"
compdef safe_rm=rm

#######################
# Remove duplicate PATH entries
# This should be one of the last things in .zshrc
# to ensure everything is deduped
function -dedupe_PATH() {
  # source: https://www.linuxjournal.com/content/removing-duplicate-path-entries
  export PATH="$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')"
}

function -.() {
  source "${MY_SCRIPTS_DIR}"/.zshrc
}

safe_rm() {
  local rm_cmd="rm $@"
  local yn
  echo -n "${rm_cmd} (y/n)? "

  if read -q yn
  then
    echo ''
    command rm "$@"
    # eval "command ${rm_cmd}"
  else
    echo "\nrm aborted"
  fi
}
