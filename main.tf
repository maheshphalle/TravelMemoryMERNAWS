module "vpc" {
  source = "./vpc"
}

module "security" {
  source    = "./security"
  vpc_id    = module.vpc.vpc_id
}

module "ec2" {
  source            = "./ec2"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  web_sg_id         = module.security.web_sg_id
  db_sg_id          = module.security.db_sg_id
}

