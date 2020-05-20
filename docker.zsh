docker_images_by_size() {
  docker images | sort -k7 -h
}

function -drunit() {
  set -x
  docker run -it --rm "$@"
}

function -drunsh() {
  drunit "$@" /bin/sh
}

function -drunbash() {
  drunit "$@" /bin/bash
}
