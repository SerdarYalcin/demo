# Prerequisites
- Ensure you have Terraform installed.
- AWS CLI should be configured with appropriate credentials.
- Ensure you have set the following environment variables { export AWS_ACCESS_KEY_ID="<access_key>" export AWS_SECRET_ACCESS_KEY="<secret_key>"}
- Ensure you have an ECR repository to store docker images
- Ensure to update the highlighted sections from the main.tf terraform file.

Steps
1) Clone the GitHub Repository
- First, clone the repository locally.
2) Initialize Terraform
- Navigate to the directory containing the Terraform files.
3) Run terraform init to initialize the Terraform project.
- This command downloads the necessary plugins and modules.
4) Apply the Configuration
- Run terraform plan to see the execution plan and verify everything is set up correctly.
- Execute terraform apply to create the resources on AWS.
5) Verify CodeBuild Project
- Move to the CodeBuild project from AWS cosole and verify the codebuild project has been created. You can then click the start build button to start the building process.
  
Post-Deployment

You can use "aws eks --region region-code update-kubeconfig --name cluster_name" to configure kubeconfig file so you can connect to the EKS cluster.
Notes: Ensure all Terraform files are correctly configured before running terraform apply. Review the Terraform plan output carefully to understand the changes that will be made.

Possible Improvements
Advanced Networking: Consider using AWS Transit Gateway for simplified network architecture, especially if integrating with multiple VPCs or on-premises networks. Implement more granular network policies within Kubernetes to control pod-to-pod communication and enhance security. Use intra-subnets for isolation of the control plane.
Security Enhancements: Introduce additional IAM roles for different levels of access, ensuring adherence to the principle of least privilege. Integrate AWS Key Management Service (KMS) for encryption of data at rest within the EKS cluster. Use Kyverno which is a Kubernetes policy engine that allows you to define and enforce policies for your Kubernetes cluster. Use Kube-bench which is an open-source tool to assess the security of Kubernetes clusters by running checks against the Center for Internet Security. Install Amazon GuardDuty EKS Runtime Monitoring add-on to have runtime threat detection to protect EKS clusters in your AWS environment.
Cost Optimization: Review the instance types and sizes used in the node groups for potential optimization. Consider using a mix of On-Demand and Spot Instances for cost savings. For long-term usage, consider buying savings plans or RIs.
Logging and Monitoring: Enable control plane components logging. Install an observability agent to get logs, metrics, and traces(e.g Amazon CloudWatch Observability to get logs and metrics.)
Storage Optimization: Evaluate the use of different storage classes in Kubernetes. For instance, you may consider Amazon EFS for persistent and shared storage requirements.
Deployment Optimization: Use EKS Blueprints to install complete EKS clusters that are fully bootstrapped with the operational software that is needed to deploy and operate workloads.
Nodes Optimization: For appropriate workloads, consider using Fargate which is a technology that provides on-demand, right-sized compute capacity for containers. With Fargate, you don't have to provision, configure, or scale groups of virtual machines on your own to run containers.
