#!/bin/bash
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

#add_to bash/bashrc ~/.bashrc
add_to <(curl -H 'Cache-Control: no-cache' -sL https://raw.githubusercontent.com/helloimalemur/dotfiles/refs/heads/master/bash/bashrc) ~/.bashrc

