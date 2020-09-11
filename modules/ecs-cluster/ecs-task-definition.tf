data "template_file" "nginx_app" {
  template = file("${path.module}/nginx.json")

  vars = {
    app_name = var.nginx_app_name
    app_image = var.nginx_app_image
    app_port = var.nginx_app_port
    fargate_cpu = 256
    fargate_memory = 512
    aws_region = "eu-east-1"
  }
}

# ECS task definition
resource "aws_ecs_task_definition" "nginx_app" {
  family = "ecs-demo-nginx-task"
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 256
  memory = 512
  container_definitions = data.template_file.nginx_app.rendered
}