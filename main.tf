module "ec2" {
  source = "./modules/ec2"

  ami = var.ami
  instance_type = var.instance_type
  tags = var.tags
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  tags = var.tags
}
