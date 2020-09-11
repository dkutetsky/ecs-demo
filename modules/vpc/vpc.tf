resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_tag
    Description = var.vpc_tag_description
    managed_by = "terraform"
    environment = var.environment
  }
}

resource "aws_subnet" "ecs_public1" {
  vpc_id     =  aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.vpc_tag} Public Subnet 1"
    Description = var.vpc_tag_description
    managed_by = "terraform"
    environment = var.environment
  }
}

resource "aws_subnet" "ecs_public2" {
  vpc_id     =  aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.vpc_tag} - Public Subnet 2"
    Description = var.vpc_tag_description
    managed_by = "terraform"
    environment = var.environment
  }
}