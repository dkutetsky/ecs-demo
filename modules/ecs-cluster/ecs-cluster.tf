resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-demo-dev-app"

  tags = {
    managed_by = "terraform"
    environment = var.environment
  }
}