#!/usr/bin/env bash
set -euo pipefail

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <carbonfox|dayfox>"
  exit 1
fi

case "$INPUT" in
carbonfox) ;;
dayfox) ;;
*)
  echo "Invalid theme: $INPUT"
  echo "Expected: carbonfox or dayfox"
  exit 1
  ;;
esac

DELTA_CONFIG="$HOME/.config/git/delta/.gitconfig"
git config --file "$DELTA_CONFIG" delta.features "$INPUT"

echo "📟 Delta theme: $INPUT"
