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

KRD_ACTIONS=("install_k8s")
curl -fsSL http://bit.ly/KRDaio | KRD_ACTIONS_DECLARE=$(declare -p KRD_ACTIONS) bash

kubectl apply -f demo.yaml
# watch 'kubectl get pods -o custom-columns=NAME:.metadata.name,Priority:.spec.priorityClassName,Status:.status.phase --sort-by="{.status.phase}"'
