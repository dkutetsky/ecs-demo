terraform {
  required_version = "=0.12.21"

  required_providers {
    aws  = "2.66.0"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_tag = "ECS demo VPC"
  environment = var.environment
}

module "lb" {
  source = "../../modules/alb"

  subnet_ids = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  environment = var.environment
}

module "ecs" {
  source = "../../modules/ecs-cluster"

  alb_arn = module.lb.alb_arn
  nginx_app_name = var.app_name
  nginx_app_port = var.app_port
  security_group_ids = module.lb.lb_sg_ids
  subnet_ids = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  environment = var.environment
}
