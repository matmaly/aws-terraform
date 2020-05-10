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

resource "aws_key_pair" "database_server" {
  key_name   = "database_server_key"
  public_key = file(var.database_server_key_file)
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
  provisioner "file" {
    source      = "/home/ubuntu/terraform/aws/keys/database_server_key"
    destination = "/home/ubuntu/"
    connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.application_server.public_ip
    private_key = file("~/terraform/aws/keys/application_server_key")
    }
  }
}

resource "aws_instance" "database_server" {
  ami 			      = data.aws_ami.ubuntu_image.id
  instance_type 	      = "t2.micro"
  key_name 		      = aws_key_pair.database_server.key_name
  subnet_id 		      = var.private_subnet_id
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.private_sq_id]
  tags = {
    Name = "Database Server_tf"
  }
}
