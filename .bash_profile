#
# ~/.bash_profile
# only runs when logging in via bash
#

# do bash stuff
[[ -f ~/.bashrc ]] && . ~/.bashrc

# ssh variables: SSH_CLIENT, SSH_CONNECTION
if [[ -n "$SSH_CONNECTION" && -z "$TMUX" ]]; then # only on non tmuxed ssh logins
  echo "* SSH'ed into new BASH login shell (executing .bash_profile)"
  if tmux has-session -t persist 2>/dev/null; then
    # adding "exec" here replaces bash with tmux!! you'll be stuck in tmux because of this
    echo "* Found persistent tmux session. Use 'detach' to exit!"
    tmux -2 -q attach -t persist
  fi

fi
