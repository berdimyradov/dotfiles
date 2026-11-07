#!/usr/bin/env bash

run_file() {
  local file="$1"

  case "$file" in
  *.curl | *.sh) bash "$file" ;;
  *.py) python3 "$file" ;;
  *.js | *.mjs) node "$file" ;;
  *.go) go run "$file" ;;
  *)
    echo "No run command configured for: $file"
    return 1
    ;;
  esac
}

run_file "$1" 2>&1 | less -R
