data "aws_availability_zones" "az" {}

data "aws_ami" "amazon_ecs_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0.*-x86_64-ebs"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ecr_repository" "app_repo" {
  name = var.container.repo_name
}
