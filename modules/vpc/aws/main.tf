# create vpc resource 
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "test-vpc"
  }
}

# create public subnet 
  //internet gateway 
  //route table 
    //route for ig 
resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.main.id 
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true 
  availability_zone = var.availability_zone
}

# create private subnet 
  //nat gateway 
    //route
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.main.id 
  cidr_block = var.private_subnet_cidr
  map_public_ip_on_launch = true 
  availability_zone = var.availability_zone
}

# create internet gateway for VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "test-gateway-vpc"
  }
}

# create route table 
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id 
  }
}

# create nat gateway for private subnet 
resource "aws_nat_gateway" "nat_private" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnets.id
}

# create security group for load balancer
resource "aws_security_group" "lb_sg" {
  name = "load_balancer_security_group"
  description = "Security group end-users for load balancer"

  # default values 
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = -1 
  }

}