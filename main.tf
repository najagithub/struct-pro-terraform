# module "ec2" {
#   source = "./modules/ec2"

#   ami = var.ami
#   instance_type = var.instance_type
#   tags = var.tags
# }

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  tags = var.tags
}

module "bastion_sg" {
  source = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  allowed_cidr = [var.ssh_my_ip]
  name         = "bastion-sg"
  tags         = var.tags
}

module "private_sg" {
  source = "./modules/security_group"

  vpc_id       = module.vpc.vpc_id
  allowed_cidr = module.bastion_sg.sg_id == "" ? "127.0.0.1/32" : "0.0.0.0/0"
  name         = "private-ec2-sg"
  tags         = var.tags
}

module "bastion" {
  source = "./modules/ec2"

  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnet_id
  security_group_id     = [module.bastion_sg.sg_id]
  key_name               = var.key_name
  associate_public_ip    = true
  tags                   = merge(var.tags, { Name = "bastion-host" })
}