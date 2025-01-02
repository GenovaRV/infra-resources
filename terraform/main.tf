# Funciona
#module "create_bucket" {
#  source  = "./modules/s3/create_bucket"
#}

module "upload_bucket" {
  source  = "./modules/s3/upload_bucket"
}