#!/usr/bin/env bash

source_dir() {
  local dir=$1
  local verbose=$2

  local directory=$(readlink -f "$dir")
  local files=( $(ls "${directory}"/*.rc) )
  local file
  for file in "${files[@]}"; do
    local to_source=$(readlink -f "$file")
    if [[ -f "${to_source}" ]]; then
      [[ ! -z $verbose ]] && echo Sourcing "${to_source}"
      source "${to_source}"
    fi
  done
}

setup() {
  local directory=$1

  source_dir "${directory}/core"
  source_dir "${directory}/installs"
  
  local directories=( $(echo ${DOCKER_BASHER_PATCH} | tr ':' ' ') )
  local dir

  for dir in "${directories[@]}"; do
    local dir_to_source=$(readlink -f $dir)
    source_dir "${dir_to_source}" verbose
  done
}

setup $(dirname $0)

"${@}"
