#!/bin/bash

# Copyright 2020 SUSE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit -o nounset -o pipefail

curl -sfL https://get.k3s.io | sh -

export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
echo "::set-output name=kubeconfig::${KUBECONFIG}"

until kubectl get node k3s 2> /dev/null; do sleep 1; done
kubectl wait node/k3s \
  --for condition=ready \
  --timeout 3m
