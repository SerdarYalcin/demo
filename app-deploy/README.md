# Prerequisites

- Installed kubectl command-line tool.
- Have a kubeconfig file (default location is ~/.kube/config).
- Install ArgoCD using the below command; 
  * kubectl create namespace argocd
  * kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manif
