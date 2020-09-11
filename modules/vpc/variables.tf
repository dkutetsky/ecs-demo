variable "vpc_tag" {
  type = string
  default = "ECS demo VPC"
}

variable "vpc_tag_description" {
  type = string
  default = "Created for ECS demo cluster"
}

variable "environment" {
  type = string
  description = "Environment name"
}