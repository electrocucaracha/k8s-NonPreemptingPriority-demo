#!/bin/bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c)
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

set -o pipefail
set -o xtrace
set -o errexit
set -o nounset

# Install dependencies
pkgs=""
for pkg in docker kind kubectl; do
    if ! command -v "$pkg"; then
        pkgs+=" $pkg"
    fi
done
if [ -n "$pkgs" ]; then
    curl -fsSL http://bit.ly/install_pkg | PKG=$pkgs bash
fi

# Create a Kubernetes cluster
newgrp docker <<EONG
if ! kind get clusters -q | grep aio; then
    kind create cluster --name aio --config=./kind-config.yaml
fi
EONG

# Deploy demo
kubectl apply -f demo.yaml
# watch 'kubectl get pods -o custom-columns=NAME:.metadata.name,Priority:.spec.priorityClassName,Status:.status.phase --sort-by="{.status.phase}"'
