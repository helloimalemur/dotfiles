#!/bin/bash
echo "installing dotfiles .."
function add_from_to() {
  if [[ -f "$1" ]]; then
    mapfile -t FIARRY <"$1"
  else
    mapfile -t FIARRY< <(curl -H 'Cache-Control: no-cache' -sL https://raw.githubusercontent.com/helloimalemur/dotfiles/refs/heads/master/"$1")
  fi

  for LI in "${FIARRY[@]}"; do
    # shellcheck disable=SC2002
    CHECK=$(cat "$2" | grep "$LI")
    if [[ -z $CHECK ]]; then
      echo "adding: $LI"
      echo "$LI" >> "$2"
    fi
  done
}

add_from_to bash/bashrc ~/.bashrc
add_from_to bash_func/bashfunc ~/.bashrc
