resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = local.tags.vpc
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags.ig
}

resource "aws_subnet" "public_sn" {
  count                   = var.num_zones
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.1.1${tostring(count.index)}.0/24"
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true
  tags                    = local.tags.public_sn
}

resource "aws_subnet" "private_sn" {
  count             = var.num_zones
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.1.2${tostring(count.index)}.0/24"
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags              = local.tags.private_sn
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags.public_rt

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
}

resource "aws_route_table_association" "public_rta" {
  count          = var.num_zones
  subnet_id      = aws_subnet.public_sn[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags.private_rt
}

resource "aws_route_table_association" "private_rta" {
  count          = var.num_zones
  subnet_id      = aws_subnet.private_sn[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
