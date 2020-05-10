#-----network/outputs.tf-----

output "vpc_id" {
  value = aws_vpc.vpc_tf.id
}

output "public_subnet_tf" {
  value = aws_subnet.public_subnet_tf.id
}

output "public_sq_id" {
  value = aws_security_group.public_security_group_tf.id
}
