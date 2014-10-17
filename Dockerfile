FROM debian:sid

RUN \
  apt-get update && \
  apt-get install -y tmux

VOLUME /logs

ADD tmux.conf /data/tmux.conf
ADD start_log_viewer.sh /data/start_log_viewer.sh

ENTRYPOINT ["/bin/bash", "/data/start_log_viewer.sh", "/logs", "/data/tmux.conf"]
