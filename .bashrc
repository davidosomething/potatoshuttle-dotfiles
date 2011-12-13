#
# .bashrc
# runs whenever a new bash is created
#
# If not running interactively (i.e. as a script), don't do anything
[[ $- != *i* ]] && return

# shell options
shopt -s checkwinsize # fix bash line wrapping when window size changes
shopt -s nocaseglob   # case insensitive
shopt -s cdspell      # fix small typos

# aliases
alias grep="grep --color"
alias ls="ls --color"
alias ll="ls -la"
alias detach="tmux detach"
alias vi="vim"
alias mvim="gvim"
alias steam='WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe -dxlevel 90 >/dev/null 2>&1 &'
alias steamdbg='WINEDEBUG=warn+all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe -dxlevel 90 &'

# variables
if [ -n "$DISPLAY" ]; then # X available?
  BROWSER=chromium
fi

# global variables available to all apps
export EDITOR='vim'
export HISTCONTROL=ignoreboth # don't save duplicate history lines
export HISTSIZE=5000
# globals for WINE
#export WINEDEBUG=-all
#export WINEARCH=win32 winecfg # skyrim should work in X86_64 mode

# prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
[[ -f /usr/share/git/completion/git-completion.bash ]] && . /usr/share/git/completion/git-completion.bash
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
  PS1="$G\u$B@$G\h$C:$Y\w\n$Z\t$P$(__git_ps1 "(%s)")\$$Z "
}
bash_prompt
unset bash_prompt

# titlebar
case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

# include bash completion
[ -r /etc/bash_completion   ] && . /etc/bash_completion
