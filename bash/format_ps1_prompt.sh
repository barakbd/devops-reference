# ----- FORMAT PS1 -----------
# add this to bash_rc or bash_profile
# source ~/.bash_format_prompt.sh
# export PS1=$(format_ps1)

# sources
# https://gist.github.com/miki725/9783474
# https://stackoverflow.com/questions/39557389/bash-file-local-variables
# https://stackoverflow.com/questions/39557389/bash-file-local-variables

# get git branch name
parse_git_branch() {
  # echo parse_git_branch
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# echo bash_format_ps1 sourced
format_ps1() {
  # echo format_ps1 called
  # colors
  # \e[ : Start color scheme. - non-printing escape sequences have to be enclosed in \[\033[ and \]
  # x;y : Color pair to use (x;y)
  # $PS1 : Your shell prompt variable.
  # \e[m : Stop color scheme.

  local RED="\[\033[0;31m\]"
  local YELLOW="\[\033[1;33m\]"
  local GREEN="\[\033[0;32m\]"
  local BLUE="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local COLOR_NONE="\[\033[0m\]"

  # VIRTUAL_ENV - don't add virtualenv - just make sure to set and export PS1 before activating the virtualenv

  # USER
  local USER="${BLUE}\u${COLOR_NONE}"

  # HOST
  local HOST="${GREEN}\h${COLOR_NONE}"

  #PWD
  local PWD="${YELLOW}\w${COLOR_NONE}"

  # GIT_BRANCH - make sure to have a backslack before calling the function so it re-evaluates every command prompt
  local GIT_BRANCH="${BLUE}\$(parse_git_branch)${COLOR_NONE}"

  # return PS1 formatted
  printf "%s" "${USER}@${HOST} ${PWD} ${GIT_BRANCH}>\n\$ "
} # end format_ps1
