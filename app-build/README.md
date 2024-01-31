# Prerequisites
- Ensure you have Terraform installed.
- AWS CLI should be configured with appropriate credentials.
- Ensure you have set the following environment variables { export AWS_ACCESS_KEY_ID="<access_key>" export AWS_SECRET_ACCESS_KEY="<secret_key>"}
- Ensure you have an ECR repository to store docker images
- Ensure to update the highlighted sections from the main.tf terraform file.

# Steps
1) Clone the GitHub Repository
- First, clone the repository locally.
2) Initialize Terraform
- Navigate to the directory containing the Terraform files.
- Run terraform init to initialize the Terraform project.
- This command downloads the necessary plugins and modules.
4) Apply the Configuration
- Run terraform plan to see the execution plan and verify everything is set up correctly.
- Execute terraform apply to create the resources on AWS.
5) Verify CodeBuild Project
- Move to the CodeBuild project from AWS console and verify the codebuild project has been created. You can then click the start build button to start the building process.

# Possible Improvements

- Versioning and Tagging Strategy: Implement a more sophisticated tagging strategy for your Docker images. Instead of just using timestamps, consider semantic versioning, especially for production-ready builds. This approach can help with better tracking and management of different versions of your application.
  
- Build Optimization: Optimize build times by using caching. AWS CodeBuild allows the caching of files and directories to speed up subsequent build runs. You can cache dependencies, Docker layers, and other frequently unchanged assets.
Consider using a more powerful build environment if your build times are longer than desired.

- Security and Compliance: Implement code scanning and security checks into your build process. Ensure compliance with best practices for IAM roles and policies. Activate enhanced scanning in AWS ECR to automatically scan Docker images for vulnerabilities, strengthening your container security.

- Automated Testing: If not already implemented, integrate automated testing in your build process. This ensures that every build is tested and reduces the likelihood of bugs making it into production.

- Monitoring and Alerts: Set up monitoring and alerts for your CI/CD pipeline. This includes monitoring the health of the CodeBuild process, the status of builds, and any failures.
