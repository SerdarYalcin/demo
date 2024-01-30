# Instructions for Deploying EKS Infrastructure Using Terraform

Prerequisites
Ensure you have Terraform installed.
AWS CLI should be configured with appropriate credentials.
Ensure you have Kubectl installed

Ensure you have set the below environment variables
export AWS_ACCESS_KEY_ID="<access_key>"
export AWS_SECRET_ACCESS_KEY="<secret_key>"
export AWS_DEFAULT_REGION=<region>

# Steps

1) Clone the GitHub Repository
First, clone the repository locally.

2) Initialize Terraform
Navigate to the directory containing the Terraform files.
Run terraform init to initialize the Terraform project. This command downloads the necessary plugins and modules.

3) Apply the Configuration
Run terraform plan to see the execution plan and verify everything is set up correctly.
Execute terraform apply to create the resources on AWS.

4) Verify the Cluster
Once the process is complete, use AWS CLI or AWS Management Console to verify that the EKS cluster is up and running.

Post-Deployment
You can use "aws eks --region region-code update-kubeconfig --name cluster_name" to configure kubeconfig file so you can connect to the EKS cluster.

Notes
Ensure all Terraform files are correctly configured before running terraform apply.
Review the Terraform plan output carefully to understand the changes that will be made.
