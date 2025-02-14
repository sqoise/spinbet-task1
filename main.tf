# Create VPC
module "foundational" {
  source               = "./modules/foundational"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  security_groups      = var.security_groups
}

module "ec2" {
  source          = "./modules/services/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  instance_name   = var.instance_name
  subnet_id       = module.foundational.public_subnet_ids[0]
  vpc_id          = module.foundational.vpc_id
  security_groups = [module.foundational.security_group_ids["web_sg"]]
}

module "rds" {
  source               = "./modules/services/rds"
  vpc_id               = module.foundational.vpc_id
  db_identifier        = var.db_identifier
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_username          = var.db_username
  db_password          = var.db_password
  private_subnet_ids   = module.foundational.private_subnet_ids
  security_groups      = [module.foundational.security_group_ids["db_sg"]]
}