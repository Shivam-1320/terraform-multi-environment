module "vpc" {
  source             = "../../modules/vpc"
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "ec2" {
  source         = "../../modules/ec2"
  environment    = var.environment
  instance_type  = var.instance_type
  instance_count = var.ec2_count
  key_name       = var.aws_key_name
  subnet_id      = module.vpc.public_subnet_id

  security_group_id = module.vpc.security_group_id
}

