#
# .bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell options
# fix line wrapping in awesome since window size keeps changing
shopt -s checkwinsize

# aliases
alias ls="ls --color"
alias ll="ls -la"

# variables

# global variables available to all apps
export EDITOR='vim'

# prompt
prompt_reset='\e[0m'
prompt_black='\e[0;30m'
prompt_red='\e[0;31m'
prompt_green='\e[0;32m'
prompt_yellow='\e[0;33m'
prompt_blue='\e[0;34m'
prompt_purple='\e[0;35m'
prompt_cyan='\e[0;36m'
prompt_white='\e[0;37m'
PS1="\[$prompt_green\]\u\[$prompt_blue\]@\[$prompt_green\]\h\[$prompt_cyan\]:\[$prompt_yellow\]\w\n\[$prompt_reset\]\$ "
case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

# include bash completion
[ -r /etc/bash_completion   ] && . /etc/bash_completion

