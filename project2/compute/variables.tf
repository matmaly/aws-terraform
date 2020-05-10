#-----compute/variables.tf-----

variable "application_server_key_file" {
  default = "~/terraform/aws/keys/application_server_key.pub"
}
variable "public_subnet_id" {}
