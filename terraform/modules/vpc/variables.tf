variable "aws_region" {
  description = "Región de AWS"
  default     = "eu-west-3"
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  default     = "grv-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block para la subred pública"
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Zona de disponibilidad"
  default     = "eu-west-3a"
}

variable "ami_id" {
  description = "ID de la AMI de la instancia EC2"
  default     = "ami-09be70e689bddcef5"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}

variable "web_content" {
  description = "Contenido de la página web"
  default     = "<html><body><h1>Hello, World!</h1></body></html>"
}
