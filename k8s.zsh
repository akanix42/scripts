decode_secret() {
  local key=$1
  local value="${2:-"config.yaml"}"
  kubectl get "secrets/${key}" --template="{{ index .data \"$value\"}}" ${*:3} | base64 -D
}

#######################
# kc depends on ./switch-kubeconfig
function kc() {
  eval $(switch-kubeconfig $1)
}

function kdeleteall() {
  k delete "$(
      k api-resources --namespaced=true --verbs=delete -o name \
      | tr "\n" "," \
      | sed -e 's/,$//'
    )" \
    --all \
    "$@"
}

function kevents() {
  k get events \
    -o custom-columns=LastSeen:.lastTimestamp,Message:.message \
    "$@" \
    | sort -k 1,1
}

function kimages() {
  pods=( $(kpods "$@") )
  for pod in "${pods[@]}"; do
    k get "pods/${pod}" \
      --output jsonpath="{.metadata.name}, container: {.spec.containers[*]['name','image']}"
    echo
  done
}

function kpods() {
  for release in "$@"; do
    k get pods \
      --selector 'app.kubernetes.io/instance='"${release}" \
      --no-headers=true \
      --output custom-columns=Name:.metadata.name
  done
}

function kx() {
  if (( $# == 1 )); then
    set "$@" /bin/bash
  fi
  set -x
  k exec -it $1 -- "$@[2,-1]"
}
