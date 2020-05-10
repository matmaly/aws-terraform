provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./network"
}

module "compute" {
  source 	     = "./compute"
  public_subnet_id = module.network.public_subnet_tf
}
