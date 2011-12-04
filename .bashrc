#
# .bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell options
# fix line wrapping in awesome since window size keeps changing
shopt -s checkwinsize

# aliases
alias grep="grep --color"
alias ls="ls --color"
alias ll="ls -la"

# variables

# global variables available to all apps
export EDITOR='vim'

# prompt
bash_prompt() {
  local Z="\[\033[0m\]"
  local K="\[\033[0;30m\]"
  local R="\[\033[0;31m\]"
  local G="\[\033[0;32m\]"
  local Y="\[\033[0;33m\]"
  local B="\[\033[0;34m\]"
  local P="\[\033[0;35m\]"
  local C="\[\033[0;36m\]"
  local W="\[\033[0;37m\]"
  PS1="$G\u$B@$G\h$C:$Y\w\n$Z\t$P\$$Z "
}

# titlebar
case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

bash_prompt
unset bash_prompt

# include bash completion
[ -r /etc/bash_completion   ] && . /etc/bash_completion

