# fink-cd
Manifests for deploying fink-broker stack over Kubernetes

See argoCD best practices for further understanding:

# Quick start

Based on https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/

# Deploy fink-broker stack

# TODO line below are optional
```sh
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd login localhost:8080 --core
``

```sh
kubectl config set-context --current --namespace=argocd

# Create fink app
argocd app create fink --dest-server https://kubernetes.default.svc \
    --dest-namespace argocd \
    --repo https://github.com/astrolabsoftware/fink-cd.git \
    --path apps --revision 748-add-support-for-argocd

# Sync fink app-of-apps
argocd app sync fink

# Synk fink apps
argocd app sync -l app.kubernetes.io/instance=fink
```

## Password for Web UI

kubectl  get secret argocd-cluster -o jsonpath='{.data.admin\.password}' | base64 -d && echo

# See
https://piotrminkowski.com/2023/05/05/manage-kubernetes-operators-with-argocd/

# Strimzi 0.31.1

Strimzi is deployed using procedure below:
https://strimzi.io/docs/operators/0.31.1/deploying#deploying-cluster-operator-str