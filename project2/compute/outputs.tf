#-----compute/main.tf-----

output "application_server_ip" {
  value = aws_instance.application_server.public_ip
}

output "database_server_ip" {
  value = aws_instance.database_server.private_ip
}
