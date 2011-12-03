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
  local p_0="\[\033[0m\]"
  local p_K="\[\033[0;30m\]"
  local p_R="\[\033[0;31m\]"
  local p_G="\[\033[0;32m\]"
  local p_Y="\[\033[0;33m\]"
  local p_B="\[\033[0;34m\]"
  local p_P="\[\033[0;35m\]"
  local p_C="\[\033[0;36m\]"
  local p_W="\[\033[0;37m\]"
  PS1="$p_G\u$p_B@$p_G\h$p_C:$p_Y\w\n$p_0\$ "
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

