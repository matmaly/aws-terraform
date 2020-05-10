#-----network/main.tf-----

resource "aws_vpc" "vpc_tf" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_tf"
  }
}

resource "aws_internet_gateway" "internet_gateway_tf" {
  vpc_id     = aws_vpc.vpc_tf.id
  depends_on = [
    aws_vpc.vpc_tf
  ]
}

resource "aws_subnet" "public_subnet_tf" {
  vpc_id     		  = aws_vpc.vpc_tf.id
  cidr_block 		  = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private_subnet_tf" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "private subnet"
  }
}

resource "aws_route_table" "public_route_table_tf" {
  vpc_id = aws_vpc.vpc_tf.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_tf.id 
  }
  tags = {
    Name = "public_route_table_tf"
  }
}

resource "aws_route_table_association" "public_rt_association_tf" {
  subnet_id 	 = aws_subnet.public_subnet_tf.id
  route_table_id = aws_route_table.public_route_table_tf.id 
}




