install_apps(){
  local directory=$1; shift

  for app in "${@}"; do
    IFS=':' read -ra SPLIT  <<< $app
    local function="install_${SPLIT[0]}"
    local args=("${SPLIT[@]}")
    args[0]=$directory
    $function "${args[@]}"
    if [[ "$?" != "0" ]]; then
      echo "Failed calling $function"
      return 1
    fi
  done
}
