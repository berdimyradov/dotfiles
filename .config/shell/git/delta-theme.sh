#!/usr/bin/env bash
set -euo pipefail

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: $0 <carbonfox|dayfox>"
  exit 1
fi

case "$INPUT" in
carbonfox)
  ;;
dayfox)
  ;;
*)
  echo "Invalid theme: $INPUT"
  echo "Expected: carbonfox or dayfox"
  exit 1
  ;;
esac

git config --global delta.features $INPUT

echo "📟 Delta theme: $INPUT"
