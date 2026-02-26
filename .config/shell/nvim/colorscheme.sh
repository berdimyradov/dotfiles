#!/bin/bash

# $1 should be "carbonfox" or "dayfox"

if [ -z "$1" ]; then
  echo "Usage: $0 <carbonfox|dayfox>"
  exit 1
fi

FLAVOUR=$1
FILE="$HOME/.config/nvim/lua/plugins/colorscheme.lua"

if [ "$FLAVOUR" != "carbonfox" ] && [ "$FLAVOUR" != "dayfox" ]; then
  echo "Invalid flavor: $FLAVOUR. Must be 'carbonfox' or 'dayfox'."
  exit 1
fi

# Replace LazyVim colorscheme value
sed -i '' "s/colorscheme = \"[a-z]*\"/colorscheme = \"$FLAVOUR\"/" "$FILE"

echo "🪶 Nvim colorscheme set to: $FLAVOUR"
