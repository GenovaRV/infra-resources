variable "bucket_name" {
  description = "El nombre de mi bucket"
  default     = "proyect-01-grv-devops-bucket"
}

variable "key" {
  description = "El nombre con el que se guardará el archivo en S3"
  default     = "archivo_terraform-bucket.html" # Nota - Lo lee desde el main.tf general de envirnments
}

variable "file_path" {
  description = "La ruta local al archivo que vamos subir"
  default     = "./files_to_upload/archivo_terraform-bucket.html"
}

variable "acl" {
  description = "El nivel de acceso, puede ser privado, público, etc."
  default     = "private"
}
