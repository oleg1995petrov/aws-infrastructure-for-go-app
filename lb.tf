resource "aws_lb" "lb" {
  subnets         = aws_subnet.private_sn.*.id
  security_groups = [aws_security_group.lbsg.id]
  tags            = local.tags.lb
}

resource "aws_lb_target_group" "lbtg" {
  vpc_id               = aws_vpc.vpc.id
  port                 = var.lbtg.port
  protocol             = var.lbtg.protocol
  deregistration_delay = var.lbtg.deregistration_delay
  tags                 = local.tags.lbtg

  health_check {
    interval = var.lbtg.health_check_interval
    matcher  = var.lbtg.health_check_matcher
  }
}

resource "aws_lb_listener" "lbl" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lbl.port
  tags              = local.tags.lbl

  default_action {
    type             = var.lbl.default_action_type
    target_group_arn = aws_lb_target_group.lbtg.arn
  }
}