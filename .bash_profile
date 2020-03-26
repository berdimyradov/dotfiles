source ~/.profile
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/berdimyradov/Library/Android/sdk
export PTOOLSPATH=/Users/berdimyradov/phalcon-devtools/
export SCRIPTS=~/scripts/
export PATH=/usr/local/bin:/usr/bin:/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:$PTOOLSPATH:$SCRIPTS:$PATH

# Make ls use colors
export CLICOLOR=1
# for white background
#export LSCOLORS=ExFxCxDxBxegedabagacad
# for black background
export LSCOLORS=gxFxhxDxbxhxhxhxhxcxcx
alias ls='ls -Fa'

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

E_NERD="🤓:"
E_FLAG_TM="🇹🇲"
E_FLAG_TJ="🇹🇯"
E_PANDA_FACE="🐼"

# Git branch in prompt.
#\x26\x23\x78\x66\x31\x32\x36
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set your prompt
# export PS1="\n$C_GREEN\u$E_FLAG_TM $C_LIGHTBLUE\h $C_DEFAULT: $C_YELLOW\w $C_PURPLE\$(parse_git_branch) $C_DEFAULT\n\$ "
ENDCOLOR="\e[0m"
export PS1="$C_BLACK$C_BG_YELLOW \w $C_DEFAULT$C_PURPLE \$(parse_git_branch) \n$C_BLACK$C_BG_YELLOW$ $ENDCOLOR "

###-appbuilder-completion-start-###
if [ -f /Users/berdimyradov/.appbuilderrc ]; then 
    source /Users/berdimyradov/.appbuilderrc 
fi
###-appbuilder-completion-end-###

. ~/VimProjects/dotfiles/git-completion.bash

# coople related configs
if [ -f ~/.rcs/.cooplerc ]; then
    source ~/.rcs/.cooplerc
else
    print "404: ~/.rcs/.cooplerc not found."
fi
source ~/.profile
