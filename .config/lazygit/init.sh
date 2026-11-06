# Variables
LG_CONF="$HOME/.config/lazygit"

# ================================================================================
# CURRENT
# ================================================================================
unalias lgit 2>/dev/null || true
lgit() {
  local mode=light appearance
  appearance="$(defaults read -g AppleInterfaceStyle 2>/dev/null || true)"

  if [[ "$appearance" == "Dark" ]]; then
    mode=dark
  fi

  theme:lazygit "$mode" >/dev/null || return 1
  command lazygit --use-config-file="$LG_CONF/config.yml,$LG_CONF/active_theme.yml" "$@"
}

# ================================================================================
# Lazy Utilities
# ================================================================================
alias lnpm='lazynpm'
alias ldocker='lazydocker'
alias lsql='lazysql'
