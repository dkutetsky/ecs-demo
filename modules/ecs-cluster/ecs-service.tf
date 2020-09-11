# ECS service
resource "aws_ecs_service" "nginx_app" {
  name = "ecs-demo-nginx-app"
  cluster = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.nginx_app.arn

  desired_count = 2

  launch_type = "FARGATE"
  network_configuration {
    security_groups = var.security_group_ids
    subnets = var.subnet_ids

    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.nginx_app.id
    container_name = var.nginx_app_name
    container_port = var.nginx_app_port
  }

  depends_on = [aws_alb_listener.http]
}

