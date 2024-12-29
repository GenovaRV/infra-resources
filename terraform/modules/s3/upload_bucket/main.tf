# Subir Archivo al bucket proyect_01_grv_devops_bucket
resource "aws_s3_bucket" "proyect_01_grv_devops_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "upload_bucket" { 
  bucket = aws_s3_bucket.proyect_01_grv_devops_bucket.bucket 
  key = var.key 
  content = file(var.file_path) # Leer contenido del archivo desde la ruta especificada en el parámetro 
  acl = var.acl 
}