#!/bin/bash
chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} nohup ./alist server --no-prefix >/root/alist.out 2>&1 &

sleep 5s

exec su-exec ${PUID}:${PGID} aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/root/.aria2/aria2.conf