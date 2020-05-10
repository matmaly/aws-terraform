#-----root/outputs.tf-----

output "vpc_id" {
  value = module.network.vpc_id
}

output "application_server_ip" {
  value = module.compute.application_server_ip
}

output "database_server_ip" {
  value = module.compute.database_server_ip
}
