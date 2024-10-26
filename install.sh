#!/bin/bash
echo ""
echo "installing dotfiles .."
function add_to() {
    mapfile -t FIARRY < "$1"
    for LI in "${FIARRY[@]}"; do
      # shellcheck disable=SC2002
      CHECK=$(cat "$2" | grep "$LI")
      if [[ -z $CHECK ]]; then
        echo "adding: $LI"
        echo "$LI" >> ~/.bashrc
      fi
    done
}

add_to bash/bashrc ~/.bashrc
