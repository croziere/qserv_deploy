#!/bin/bash

#  Restart Docker service on all nodes 

# @author Fabrice Jammes SLAC/IN2P3

set -e
set -x

CLUSTER_CONFIG_DIR="$HOME/.lsst/qserv-cluster"
# GNU parallel ssh configuration
PARALLEL_SSH_CFG="$CLUSTER_CONFIG_DIR/sshloginfile"

SERVICE=docker
#SERVICE=kubelet

echo "Restart $SERVICE service on node"
parallel --nonall --tag --slf "$PARALLEL_SSH_CFG" \
    "sudo /bin/systemctl  daemon-reload && \
     sudo /bin/systemctl restart ${SERVICE}.service && \
     echo \"$SERVICE\" restarted"

