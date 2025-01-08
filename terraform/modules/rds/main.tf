# ------------------------------------------------------------------
# El RDS, es un servicio de base de datos relacional administrado 
# por AWS.
# ------------------------------------------------------------------

module "security_group" {
  source  = "../security_group"
  vpc_id  = var.vpc_id
  db_name = var.db_name
}

resource "aws_db_instance" "main" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  multi_az               = true
  publicly_accessible    = false
  vpc_security_group_ids = [module.security_group.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = var.db_name
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.private_subnet_ids  # Aquí se usa la variable
}

