variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "private_subnet_ids" {  # Verifica que esta variable esté definida
  description = "Lista de IDs de subredes privadas"
  type        = list(string)
}

variable "allocated_storage" {
  description = "Almacenamiento asignado (en GB)"
  type        = number
}

variable "engine" {
  description = "Motor de base de datos"
  type        = string
}

variable "engine_version" {
  description = "Versión del motor de base de datos"
  type        = string
}

variable "instance_class" {
  description = "Clase de instancia"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
}

variable "password" {
  description = "Contraseña para la base de datos"
  type        = string
}

variable "parameter_group_name" {
  description = "Nombre del grupo de parámetros de la base de datos"
  type        = string
}
