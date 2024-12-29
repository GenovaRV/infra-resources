output "bucket_name" {
  description = "El nombre del bucket de S3 creado"
  value       = aws_s3_bucket.create_bucket.bucket
}

output "bucket_arn" {
  description = "El Amazon Resource Name (ARN) del bucket de S3"
  value       = aws_s3_bucket.create_bucket.arn
}

output "bucket_region" {
  description = "La región en la que se encuentra el bucket de S3"
  value       = aws_s3_bucket.create_bucket.region
}

output "bucket_domain_name" {
  description = "El nombre de dominio del bucket de S3"
  value       = aws_s3_bucket.create_bucket.bucket_domain_name
}

output "bucket_id" {
  description = "El ID del bucket de S3"
  value       = aws_s3_bucket.create_bucket.id
}

