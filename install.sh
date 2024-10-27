#!/bin/bash
echo "installing dotfiles .."
function add_from_to() {
  if [[ -f bash/bashrc ]]; then
    mapfile -t FIARRY <"$1"
  else
    mapfile -t FIARRY< <(curl -H 'Cache-Control: no-cache' -sL https://raw.githubusercontent.com/helloimalemur/dotfiles/refs/heads/master/"$1")
  fi
    for LI in "${FIARRY[@]}"; do
      # shellcheck disable=SC2002
      CHECK=$(cat "$2" | grep "$LI")
      if [[ -z $CHECK ]]; then
        echo "adding: $LI"
        echo "$LI" >> ~/.bashrc
      fi
    done
}

add_from_to bash/bashrc ~/.bashrc

