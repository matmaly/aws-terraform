#-----compute/variables.tf-----

variable "application_server_key_file" {
  default = "~/terraform/aws/keys/application_server_key.pub"
}
variable "database_server_key_file" {
  default = "~/terraform/aws/keys/database_server_key.pub"
}
variable "public_subnet_id" {}
variable "public_sq_id" {}
variable "private_subnet_id" {}
variable "private_sq_id" {}
