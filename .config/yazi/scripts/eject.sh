#!/usr/bin/env bash

volume="${1:?No volume provided}"

printf 'Eject %s? [y/N] ' "$volume"
read -r answer

if [[ "$answer" == [yY] ]]; then
  diskutil eject "$volume"
fi
