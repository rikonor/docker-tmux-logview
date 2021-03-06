#!/bin/bash

echo "Starting log viewer"

LOGS_DIR=$1
echo "LOGS_DIR=$LOGS_DIR"

TMUX_CONF=$2
echo "TMUX_CONF=$TMUX_CONF"

s=$(tmux new -dP);

for i in ${@:3}; do
  echo "Found log file -> "$LOGS_DIR"/$i"
  tmux neww -n $(basename $i) -d "tail -f $(readlink -f "$LOGS_DIR"/$i)";
done

tmux killw -t "$s"0

echo "Setting custom tmux.conf file"
tmux source-file $TMUX_CONF

echo "Attaching to tmux..."
tmux attach
