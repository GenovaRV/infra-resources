# Subir Archivo al bucket proyect_01_grv_devops_bucket

# Verifica si el bucket ya existe
data "aws_s3_bucket" "existing_bucket" {
  bucket = var.bucket_name
}

# Subir archivo al bucket, solo si el bucket ya existe
resource "aws_s3_object" "upload_bucket" {
  bucket  = var.bucket_name
  key     = var.key
  content = file(var.file_path)
  acl     = var.acl

  # Dependencia en la verificación de la existencia del bucket
  depends_on = [data.aws_s3_bucket.existing_bucket]
}


