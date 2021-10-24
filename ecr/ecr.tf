terraform {
  backend "s3" {
    bucket = "ventz-devops"
    key    = "exam/go/ecr.tfstate"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14.9"
}

resource "aws_ecr_repository" "app_repo" {
  name = var.container.repo_name

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "app_repo_policy" {
  repository = aws_ecr_repository.app_repo.name
  policy     = file("policies/ecr_lifecycle_policy")
}
