#!/bin/bash
HOST=host
IP=ip
MAIN_DIR=/tmp

    pattern="
        Host ${HOST} \n   
            HostName ${IP} \n
            StrictHostKeyChecking no\n

    "
    echo -e ${pattern} >> ${MAIN_DIR}/config

if [ "$(hostname)" == "lumpy-homewrold" ]; then
  echo "Its not my homeworld."
else
  echo "Its my homeworld."
fi
