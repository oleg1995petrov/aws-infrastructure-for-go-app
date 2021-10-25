variable "instance_type" {
  default = "t3.micro"
}

variable "instances_per_zone" {
  default = 1
}

variable "num_zones" {
  default = 2
}

variable "common_tags" {
  default = {
    Owner       = "Aleh Ventskovich"
    Project     = "Go"
    Environment = "Dev"
  }
}

variable "vpc" {
  type = map(string)

  default = {
    cidr_block = "10.2.0.0/16"
  }
}

variable "lbsg" {
  type = list(any)

  default = [
    {
      from_port   = 80,
      to_port     = 80,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "isg" {
  type = list(any)

  default = [
    {
      from_port   = 49153,
      to_port     = 63635,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "lbtg" {
  type = map(any)

  default = {
    port                  = 80
    protocol              = "HTTP"
    deregistration_delay  = 5
    health_check_interval = 20
    health_check_matcher  = "200"
  }
}

variable "lbl" {
  type = map(any)

  default = {
    port                = 80
    default_action_type = "forward"
  }
}

variable "asg" {
  default = {
    health_check_grace_period = 60
    desired_capacity          = 2
    min_size                  = 1
    max_size                  = 4
    health_check_type         = "ELB"
  }
}

variable "ecs_cluster_name" {
  default = "go"
}

variable "ecs_service_name" {
  default = "go"
}

variable "ordered_placement_strategies" {
  type = list(map(string))

  default = [
    {
      type  = "spread",
      field = "attribute:ecs.availability-zone"
    },
    {
      type  = "spread",
      field = "instanceId"
    }
  ]
}

variable "container" {
  default = {
    family        = "go"
    name          = "hello_go"
    repo_name     = "go"
    cpu           = 256
    memory        = 256
    essential     = true
    containerPort = 8080
    hostPort      = 0
  }
}

variable "image_tag" {
  type    = string
  default = "lalest"
}
