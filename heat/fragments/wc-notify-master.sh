#!/bin/sh

. /etc/sysconfig/heat-params

# until curl -sf "http://127.0.0.1:8080/healthz"; do
#     echo "Waiting for Kubernetes API..."
#     sleep 5
# done

docker swarm init

SWARM_WORKER_TOKEN=`docker swarm join-token -q worker`
SWARM_MANAGER_TOKEN=`docker swarm join-token -q manager`

sh -c "$WAIT_CURL --data-binary '{\"status\": \"SUCCESS\",\"data\": \"${SWARM_WORKER_TOKEN}\"}'"
