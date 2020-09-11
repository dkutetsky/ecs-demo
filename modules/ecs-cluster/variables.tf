variable "ecs_name" {
  type = string
  default = "ECS demo"
}

variable "ecs_tag_description" {
  type = string
  default = "ECS demo"
}

variable "vpc_id" {
  type = string
}

variable "alb_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "nginx_app_name" {
  type = string
}

variable "nginx_app_port" {
  type = number
  default = 80
}

variable "nginx_app_image" {
  description = "Docker image to run in the ECS cluster"
  default = "nginx:latest"
}

variable "environment" {
  type = string
  description = "Environment name"
}