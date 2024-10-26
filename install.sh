#!/bin/bash

LINES=$(cat bash/bashrc)
for LI in "${LINES[@]};"; do
  CHECK=$(cat ~/.bashrc | grep "$LI")
  if [[ -z $CHECK ]]; then
    echo "adding: $LI"
    cat bash/bashrc >> ~/.bashrc
  fi
done

#cat bash/bashrc >> ~/.bashrc