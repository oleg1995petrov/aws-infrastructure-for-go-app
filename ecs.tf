resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
  tags = local.tags.cluster
}

resource "aws_ecs_service" "ecs_service" {
  name                  = var.service_name
  cluster               = aws_ecs_cluster.ecs_cluster.id
  task_definition       = aws_ecs_task_definition.task_definition.arn
  desired_count         = var.num_zones
  wait_for_steady_state = true
  tags                  = local.tags.service

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategies
    iterator = i
    content {
      type  = i.value.type
      field = i.value.field
    }
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.lbtg.arn
    container_name   = var.container.name
    container_port   = var.container.containerPort
  }

  depends_on = [aws_lb_listener.lbl]
}

resource "aws_ecs_task_definition" "task_definition" {
  family = var.container.family
  tags   = local.tags.td

  container_definitions = jsonencode([
    {
      name      = var.container.name
      image     = local.app_image
      cpu       = var.container.cpu
      memory    = var.container.memory
      essential = var.container.essential
      portMappings = [
        {
          containerPort = var.container.containerPort
          hostPort      = var.container.hostPort
        }
      ]
    }
  ])
}