resource "aws_security_group" "lbsg" {
  name_prefix = local.name_prefixes.lbsg
  vpc_id      = aws_vpc.vpc.id
  tags        = local.tags.lbsg

  dynamic "ingress" {
    for_each = var.lbsg
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "isg" {
  name_prefix = local.name_prefixes.isg
  vpc_id      = aws_vpc.vpc.id
  tags        = local.tags.isg

  dynamic "ingress" {
    for_each = var.isg
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
