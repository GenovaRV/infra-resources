output "bucket_name" {
  description = "El nombre del bucket de S3 creado"
  value       = aws_s3_bucket.proyect_01_grv_devops_bucket.bucket
}

output "bucket_arn" {
  description = "El Amazon Resource Name (ARN) del bucket de S3"
  value       = aws_s3_bucket.proyect_01_grv_devops_bucket.arn
}

output "bucket_region" {
  description = "La región en la que se encuentra el bucket de S3"
  value       = aws_s3_bucket.proyect_01_grv_devops_bucket.region
}

output "bucket_domain_name" {
  description = "El nombre de dominio del bucket de S3"
  value       = aws_s3_bucket.proyect_01_grv_devops_bucket.bucket_domain_name
}

output "bucket_id" {
  description = "El ID del bucket de S3"
  value       = aws_s3_bucket.proyect_01_grv_devops_bucket.id
}

output "object_url" {
  description = "La URL del objeto subido al bucket de S3"
  value       = "https://${aws_s3_bucket.proyect_01_grv_devops_bucket.bucket}.s3.amazonaws.com/${aws_s3_object.upload_bucket.key}"
}
