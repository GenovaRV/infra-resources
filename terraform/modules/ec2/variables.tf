variable "instance_name" {
  description = "El nombre que se asignará a la instancia EC2"
  default     = "instancia-ec2-grv"
}

variable "ami_id" {
  description = "El ID de la AMI para la instancia EC2"
  default     = "ami-09be70e689bddcef5"  
}

variable "instance_type" {
  description = "El tipo de instancia EC2"
  default     = "t2.micro"
}

