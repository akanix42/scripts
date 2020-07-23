dev() {
  (
  set -eo pipefail

  if [[ -f "package.json" ]] \
    && jq -e .scripts.dev package.json
  then
    nvm use
    npm run dev
    return
  fi

  echo 'No supported development environment detected'
  )
}
