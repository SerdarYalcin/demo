# Prerequisites

- Installed kubectl command-line tool.
- Have a kubeconfig file (default location is ~/.kube/config).
- Install ArgoCD using the below commands; 
  * kubectl create namespace argocd
  * kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  * kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo   > Use this to get the initial admin password
  * kubectl port-forward svc/argocd-server -n argocd 8080:443

- Download the latest Argo CD version from https://github.com/argoproj/argo-cd/releases/latest. More detailed installation instructions can be found via the CLI installation documentation.

# Steps
