#!/usr/bin/env bash

source_dir() {
  local dir=$1

  local directory=$(readlink -f "$dir")
  local files=( $(ls "${directory}"/*.rc) )
  for file in "${files[@]}"; do
    local to_source=$(readlink -f "$file")
    if [[ -f "${to_source}" ]]; then
      echo Sourcing "${to_source}"
      source "${to_source}"
    fi
  done
}

directory=$(dirname $0)
source_dir "${directory}/core"
source_dir "${directory}/software"

directories=( $(find / -maxdepth 1 -type d -name 'docker-basher-patch*') )
for dir in "${directories[@]}"; do
  directory=$(readlink -f $dir)
  source_dir "${directory}"
done

"${@}"
