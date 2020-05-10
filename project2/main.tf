provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./network"
}

module "compute" {
  source 	     = "./compute"
  public_subnet_id   = module.network.public_subnet_id
  public_sq_id       = module.network.public_sq_id
  private_subnet_id  = module.network.private_subnet_id
  private_sq_id      = module.network.private_sq_id
}
