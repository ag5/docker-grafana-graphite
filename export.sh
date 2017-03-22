#!/bin/bash

if [[ "${SSH_USERNAME}" == "" ]]; then
  echo "Specify your SSH username using the SSH_USERNAME environment variable"
  exit 1
fi

docker save ag5/statsd | plink ${SSH_USERNAME}@logstats.mgmt.inter.ag5.com "sudo docker load"
