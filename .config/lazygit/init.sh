# Variables
LG_CONF="$HOME/.config/lazygit"

# ================================================================================
# CURRENT
# ================================================================================
unalias lgit 2>/dev/null || true
unfunction lgit 2>/dev/null || true
alias lgit='lazygit --use-config-file="$LG_CONF/config.yml"'

# ================================================================================
# Lazy Utilities
# ================================================================================
alias lnpm='lazynpm'
alias ldocker='lazydocker'
alias lsql='lazysql'
