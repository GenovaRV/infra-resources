# Llamadas Modulos

# Creación de Instancia OK
/*
module "ec2" {
  source  = "./modules/ec2/create_instance"
}
*/

# Creación bucket OK
/*
module "create_bucket" {
  source  = "./modules/s3/create_bucket"
}
*/

# Subir archivo OK
/*
module "upload_bucket" {
  source  = "./modules/s3/upload_bucket"
}
*/

# Creacion de vpc con web OK
/*
module "vpc" {
  source  = "./modules/vpc"
}
*/


module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  subnet_count         = var.subnet_count
  availability_zones   = var.availability_zones
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
  db_name = var.db_name
}

module "create_rds" {
  source                = "./modules/rds"
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  allocated_storage     = var.allocated_storage
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.username
  password              = var.password
  parameter_group_name  = var.parameter_group_name
}

