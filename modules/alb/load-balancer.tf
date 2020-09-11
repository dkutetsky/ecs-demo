# ECS ALB
resource "aws_lb" "ecs_alb" {
  name = "ecs-demo-lb"
  internal = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups = [aws_security_group.sg_alb.id]

  subnets = var.subnet_ids

  tags = {
    managed_by = "terraform"
    environment = var.environment
  }
}
