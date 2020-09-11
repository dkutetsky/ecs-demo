output "alb_arn" {
  value = aws_lb.ecs_alb.arn
}

output "nginx_dns_lb" {
  value = aws_lb.ecs_alb.dns_name
}

output "lb_sg_ids" {
  value = [aws_security_group.sg_alb.id]
}