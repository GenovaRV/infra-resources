# Llamadas Modulos

# Creación de Instancia OK
/*
module "ec2" {
  source  = "./modules/ec2"
}
*/

# Creación bucket OK
/*
module "create_bucket" {
  source  = "./modules/s3/create_bucket"
}
*/

# Subir archivo OK
module "upload_bucket" {
  source  = "./modules/s3/upload_bucket"
}

# Creacion de vpc con web OK
module "vpc" {
  source  = "./modules/vpc"
}