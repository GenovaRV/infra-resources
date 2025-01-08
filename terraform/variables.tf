variable "aws_region" {
  description = "Región de AWS"
  type        = string
}

variable "aws_profile" {
  description = "Perfil de AWS"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  type        = string
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad"
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

variable "subnet_count" {
  description = "Número de subredes a crear"
  type        = number
}
