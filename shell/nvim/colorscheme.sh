#!/bin/bash

# $1 should be "latte" or "mocha"

if [ -z "$1" ]; then
  echo "Usage: $0 <latte|mocha>"
  exit 1
fi

FLAVOUR=$1
FILE="$HOME/.config/nvim/lua/plugins/colorscheme.lua"

if [ "$FLAVOUR" != "latte" ] && [ "$FLAVOUR" != "mocha" ]; then
  echo "Invalid flavor: $FLAVOUR. Must be 'latte' or 'mocha'."
  exit 1
fi

# Use sed to replace the flavour line
# We look for `flavour = "..."` and replace the content inside quotes
sed -i '' "s/flavour = \"[a-z]*\"/flavour = \"$FLAVOUR\"/" "$FILE"

echo "🪶 Nvim colorscheme set to: $FLAVOUR"
