/* resource "aws_vpc_endpoint" "ecs_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ecs"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.ecs_endpoint
}

resource "aws_vpc_endpoint" "ecs_agent_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ecs-agent"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.ecs_agent_endpoint
}

resource "aws_vpc_endpoint" "ecs_telemetry_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ecs-telemetry"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.ecs_telemetry_endpoint
}

resource "aws_vpc_endpoint" "ecr_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.ecr_endpoint

}
resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.ecr_api_endpoint
}

resource "aws_vpc_endpoint" "app_endpoint" {
  vpc_id              = aws_vpc.vpc.id
  service_name        = "com.amazonaws.${local.region}.application-autoscaling"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private_sn.*.id
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.ecssg.id]
  tags   = local.tags.app_endpoint
} */