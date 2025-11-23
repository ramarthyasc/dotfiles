#!/usr/bin/env bash

if [[ "$1" == "w" ]]; then
    BIND_COMMAND_TMUX_W
elif [[ "$1" == "s" ]]; then
    BIND_COMMAND_TMUX_S
fi
