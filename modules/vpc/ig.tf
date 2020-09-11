# create internet gateway
resource "aws_internet_gateway" "aws-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ecs-demo-igw"
    managed_by = "terraform"
    environment = var.environment
  }
}
# create routes
resource "aws_route_table" "aws-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-igw.id
  }

  tags = {
    Name = "ecs-demo-route-table"
    managed_by = "terraform"
    environment = var.environment
  }
}
resource "aws_main_route_table_association" "aws-route-table-association" {
  vpc_id = aws_vpc.main.id
  route_table_id = aws_route_table.aws-route-table.id
}
