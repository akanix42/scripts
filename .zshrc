#!/bin/zsh
MY_SCRIPTS_DIR="$(realpath "$(dirname "$0")")"
export PATH="${MY_SCRIPTS_DIR}/bin:${MY_SCRIPTS_DIR}:${PATH}"

for script in "${MY_SCRIPTS_DIR}"/*.zsh; do
  source "${script}"
done
