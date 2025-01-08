# ------------------------------------------------------------------
# Los security groups, actúan como un firewall virtual que controla 
# el tráfico de entrada y salida a nivel de instancia controlando 
# el acceso a los puertos de tus recursos dentro de mi VPC
# ------------------------------------------------------------------

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306 # Puerto mysql
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_name}-rds-sg"
  }
}
