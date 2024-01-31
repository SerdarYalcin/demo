# Prerequisites

- Installed kubectl command-line tool.
- Have a kubeconfig file (default location is ~/.kube/config).
- Install ArgoCD using the below commands; 
  * kubectl create namespace argocd
  * kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  * kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo   > Use this to get the initial admin password
  * kubectl port-forward svc/argocd-server -n argocd 8080:443

- Download the latest Argo CD version from https://github.com/argoproj/argo-cd/releases/latest. More detailed installation instructions can be found via the CLI installation documentation.
- Install the Kubernetes Metrics Server using the below command;
   * kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Steps
1) Run argocd login localhost:8080 --insecure
   - This is used to connect ArgoCD using CLI.
2) Run argocd repo add https://github.com/SerdarYalcin/demo.git
   - This is used to add a GitHub repository, enabling us to deploy the application from it.
3) Run kubectl apply -f argocd-app.yaml
   - This is used for deploying the application to the EKS cluster.
  
 # Possible Improvements
- Advanced Deployment Strategies: Configure sync policies, sync options, sync phases, and sync waves based on your deployment. Use applicationSet for multi-cluster deployment. Implement Blue/Green or Canary deployments using Argo Rollouts for safer and more controlled updates.
- Enhanced Security Measures: Secure your cluster with Kubernetes Network Policies.
- Resource Optimization and Autoscaling: Monitor and optimize costs, possibly using tools like Kubecost.
- Disaster Recovery and Backup: Implement a robust backup strategy and regularly test your disaster recovery procedures.
- Secrets Management: Manage secrets securely using AWS Secrets Manager, AWS KMS.
- High Availability: Ensure your  applications are configured for high availability, especially across multiple Availability Zones.
- Robust Monitoring and Logging: Install the CloudWatch observability agent and ensure that your EKS cluster sends metrics, and logs to CloudWatch
- Use an Elastic Load Balancer (ELB) instead of a NodePort service for a production environment to ensure enhanced scalability, reliability, and network performance.
