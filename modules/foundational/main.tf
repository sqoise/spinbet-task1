resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnets
resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidrs

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, index(var.public_subnet_cidrs, each.value))

  tags = {
    Name = "Public Subnet ${each.key}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private" {
  for_each = var.private_subnet_cidrs

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(var.private_subnet_cidrs, each.value))

  tags = {
    Name = "Private Subnet ${each.key}"
  }
}
resource "aws_security_group" "sg" {
  for_each = var.security_groups

  name        = each.value.name
  description = "Security group for ${each.value.name}"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = each.value.rules
    content {
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol

      # Handle dynamic reference to another SG properly
      security_groups = lookup(ingress.value, "source_sg", null) != null ? [aws_security_group.sg[ingress.value.source_sg].id] : null

      cidr_blocks = lookup(ingress.value, "cidr_blocks", [])
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.value.name
  }
}