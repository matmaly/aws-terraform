#-----network/outputs.tf-----

output "vpc_id" {
  value = aws_vpc.vpc_tf.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet_tf.id
}

output "public_sq_id" {
  value = aws_security_group.public_security_group_tf.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet_tf.id
}

output "private_sq_id" {
  value = aws_security_group.private_security_group_tf.id
}
