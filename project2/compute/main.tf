#-----compute/main.tf-----

data "aws_ami" "ubuntu_image" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_key_pair" "application_server" {
  key_name   = "application_server_key"
  public_key = file(var.application_server_key_file)
}

resource "aws_instance" "application_server" {
  ami 			      = data.aws_ami.ubuntu_image.id
  instance_type 	      = "t2.micro"
  key_name      	      = aws_key_pair.application_server.key_name
  subnet_id 		      = var.public_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.public_sq_id]
  tags = {
    Name = "Application Server_tf"
  }
}
