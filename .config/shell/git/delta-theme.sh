#!/bin/bash

THEME=$1
CONFIG_PATH="$HOME/.config/git/delta/.gitconfig"

sed -i '' "s/^.*features = .*$/    features = $THEME/" "$CONFIG_PATH"
echo "📟 Delta theme: $THEME"
