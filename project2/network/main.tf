#-----network/main.tf-----

resource "aws_vpc" "vpc_tf" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_tf"
  }
}

resource "aws_internet_gateway" "internet_gateway_tf" {
  vpc_id     = "${aws_vpc.vpc_tf.id}"
  depends_on = [
    aws_vpc.vpc_tf
  ]
}

resource "aws_subnet" "public_subnet" {
  vpc_id     		  = "${aws_vpc.vpc_tf.id}"
  cidr_block 		  = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = "${aws_vpc.vpc_tf.id}"
  cidr_block = "${var.private_subnet_cidr}"
  tags = {
    Name = "private subnet"
  }
}
