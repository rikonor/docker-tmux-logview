#!/bin/bash

alias _logview="sudo docker run --rm -it -v /home/rikonor/tmp/tmux_docker/logs:/logs rikonor/logview"

function logview() {
  _logview $(cat $1)
}
