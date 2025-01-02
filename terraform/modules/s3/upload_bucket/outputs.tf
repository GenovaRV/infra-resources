output "bucket_name" {
  description = "El nombre del bucket de S3 usado"
  value       = var.bucket_name
}

output "object_url" {
  description = "La URL del objeto subido al bucket de S3"
  value       = "https://${var.bucket_name}.s3.amazonaws.com/${aws_s3_object.upload_bucket.key}"
}
