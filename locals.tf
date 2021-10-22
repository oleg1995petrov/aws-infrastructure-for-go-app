locals {
  num_instances = var.num_zones * var.instances_per_zone
}

locals {
  app_image = "${data.aws_ecr_repository.app_repo.repository_url}:latest"
}

locals {
  tags = {
    vpc        = merge(var.common_tags, { Name = "VPC" })
    ig         = merge(var.common_tags, { Name = "Gateway" })
    private_sn = merge(var.common_tags, { Name = "Private subnet" })
    public_sn  = merge(var.common_tags, { Name = "Public subnet" })
    public_rt  = merge(var.common_tags, { Name = "Gateway route table" })
    private_rt = merge(var.common_tags, { Name = "Private route table" })
    lb         = merge(var.common_tags, { Name = "Load balancer" })
    lbsg       = merge(var.common_tags, { Name = "Load balancer security group" })
    ecssg       = merge(var.common_tags, { Name = "ECS security group" })
    lbtg       = merge(var.common_tags, { Name = "Load balancer target group" })
    isg        = merge(var.common_tags, { Name = "Instance security group" })
    tg         = merge(var.common_tags, { Name = "Target group" })
    ecs_endpoint = merge(var.common_tags, { Name = "ECS endpoint" })
    ecs_agent_endpoint = merge(var.common_tags, { Name = "ECS agent endpoint" })
    ecs_telemetry_endpoint = merge(var.common_tags, { Name = "ECS elemetry endpoint" })
    ecr_endpoint = merge(var.common_tags, { Name = "ECR endpoint" })
    ecr_api_endpoint = merge(var.common_tags, { Name = "ECR API endpoint" })
    app_endpoint = merge(var.common_tags, { Name = "App endpoint" })
    lbl        = merge(var.common_tags, { Name = "Load balancer listener" })
    cluster    = merge(var.common_tags, { Name = "Cluster" })
    service    = merge(var.common_tags, { Name = "Service" })
    td         = merge(var.common_tags, { Name = "Task definition" })
  }
}
