#!/bin/bash

if [[ -z "$SSH_CONNECTION" && -z "$TMUX" ]]; then # only on non tmuxed ssh logins

  while :; do
    if ! tmux has-session -t persist 2>/dev/null; then
      cd /home/davidosomething
      tmux -2 -q new -d -s persist 2>/dev/null
    fi
    sleep 30
  done

fi
