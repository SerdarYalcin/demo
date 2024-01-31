resource "aws_codebuild_project" "example" {
  name          = "demo"
  build_timeout = 5 # Timeout in minutes
  service_role  = aws_iam_role.example.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "us-east-1" # Replace with your AWS region
    }
    environment_variable {
      name  = "ECR_REGISTRY_URL"
      value = "05xxxxxxxx.dkr.ecr.us-east-1.amazonaws.com" # Replace with your ECR registry URL (without repository name)
    }
    environment_variable {
      name  = "ECR_REPOSITORY_NAME"
      value = "demo" # Replace with your ECR repository name
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/SerdarYalcin/demo" # Replace with your GitHub repo URL
    git_clone_depth = 1
    buildspec       = "app-build/buildspec.yml" # Path to your buildspec file in the repo
  }

  cache {
    type  = "NO_CACHE"
  }
}

resource "aws_iam_role" "example" {
  name = "codebuild-example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "codebuild.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "example-ecr" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}


resource "aws_iam_role_policy" "codebuild_logging_policy" {
  name = "codebuild-logging-policy"
  role = aws_iam_role.example.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = [
          "arn:aws:logs:us-east-1:0557xxxxxxxxxxx:log-group:/aws/codebuild/demo",   # Replace it with your AWS Account ID
          "arn:aws:logs:us-east-1:0557xxxxxxxxxxx:log-group:/aws/codebuild/demo:*"  # Replace it with your AWS Account ID
        ]
      }
    ]
  })
}

# Attach additional necessary policies as needed...
