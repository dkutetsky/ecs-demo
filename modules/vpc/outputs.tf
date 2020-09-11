output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.ecs_public1.id, aws_subnet.ecs_public2.id]
}

output "ig_id" {
  value = aws_internet_gateway.aws-igw.id
}