variable "app_port" {
  description = "Application port"
  type = number
}

variable "app_name" {
  description = "Application name"
  type = string
}

variable "environment" {
  description = "Environment name (dev, test, prod, etc.)"
  type = string
}