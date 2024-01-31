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
  
