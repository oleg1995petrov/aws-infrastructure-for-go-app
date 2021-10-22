terraform {
  backend "s3" {
    bucket = "ventz-devops"
    key    = "exam/go/terraform.tfstate"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 0.14.9"
}
