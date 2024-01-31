# Prerequisites

- Installed kubectl command-line tool.
- Have a kubeconfig file (default location is ~/.kube/config).
- Install ArgoCD using the below commands; 
  * kubectl create namespace argocd
  * kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
  * kubectl port-forward svc/argocd-server -n argocd 8080:443
