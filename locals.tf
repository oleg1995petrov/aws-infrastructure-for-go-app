locals {
  num_instances = var.num_zones * var.instances_per_zone
}

locals {
  app_image = "${data.aws_ecr_repository.app_repo.repository_url}:${var.image_tag}"
}

locals {
  tags = {
    vpc = merge(var.common_tags, { Name = "VPC" })
    ig  = merge(var.common_tags, { Name = "Gateway" })
    public_sn = merge(var.common_tags, { Name = "Public subnet" })
    public_rt = merge(var.common_tags, { Name = "Gateway route table" })
    lb          = merge(var.common_tags, { Name = "Load balancer" })
    lbsg        = merge(var.common_tags, { Name = "Load balancer security group" })
    lbtg        = merge(var.common_tags, { Name = "Load balancer target group" })
    isg         = merge(var.common_tags, { Name = "Instance security group" })
    tg          = merge(var.common_tags, { Name = "Target group" })
    lbl         = merge(var.common_tags, { Name = "Load balancer listener" })
    ecs_cluster = merge(var.common_tags, { Name = "ECS Cluster" })
    ecs_service = merge(var.common_tags, { Name = "ECS Service" })
    td          = merge(var.common_tags, { Name = "Task definition" })
  }

  name_prefixses = {
    lb   = "${lower(var.common_tags.Project)}"
    lbtg = "${lower(var.common_tags.Project)}"
    lbsg = "${lower(var.common_tags.Project)}-${lower(var.common_tags.Environment)}-"
    isg  = "${lower(var.common_tags.Project)}-${lower(var.common_tags.Environment)}-"
    asg  = "${lower(var.common_tags.Project)}-${lower(var.common_tags.Environment)}-"
    lc   = "${lower(var.common_tags.Project)}-${lower(var.common_tags.Environment)}-"
  }
}
