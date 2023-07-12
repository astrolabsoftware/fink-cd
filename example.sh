#!/bin/bash

set -euxo pipefail

kubectl config set-context --current --namespace=argocd
argocd app create apps    --dest-namespace argocd  \
  --dest-server https://kubernetes.default.svc \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path apps
argocd app sync apps
