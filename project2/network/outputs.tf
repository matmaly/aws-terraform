#-----network/outputs.tf-----

output "vpc_id" {
  value = aws_vpc.vpc_tf.id
}

output "public_subnet_tf" {
  value = aws_subnet.public_subnet_tf.id
}
