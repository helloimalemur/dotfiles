#!/bin/bash

function add_to() {
    # shellcheck disable=SC2002
    # shellcheck disable=SC2162
    cat "$1" | while read LI; do
      CHECK=$(cat "$2" | grep "$LI")
      if [[ -z $CHECK ]]; then
        echo "adding: $LI"
        echo "$LI" >> ~/.bashrc
      fi
    done
}


add_to bash/bashrc ~/.bashrc
