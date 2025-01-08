# ------------------------------------------------------------------
# Este módulo gestiona la creación del grupo de seguridad necesario 
# para la base de datos RDS.
# ------------------------------------------------------------------

module "security_group" {
  source  = "../security_group"  
  # ID de la VPC donde se creará el grupo de seguridad
  vpc_id  = var.vpc_id  
  db_name = var.db_name  
}

# ------------------------------------------------------------------
# El RDS (Relational Database Service) es un servicio de base de 
# datos relacional administrado por AWS.
# ------------------------------------------------------------------

resource "aws_db_instance" "main" {

  # Especifica el almacenamiento asignado para la base de datos RDS en GB.
  allocated_storage      = var.allocated_storage

  # Tipo de motor de base de datos que se utilizará (por ejemplo, MySQL, PostgreSQL).
  engine                 = var.engine

  # Versión específica del motor de base de datos a utilizar.
  engine_version         = var.engine_version

  # Clase de instancia que define la capacidad computacional y memoria de la instancia.
  instance_class         = var.instance_class

  # Nombre de usuario para la base de datos.
  username               = var.username

  # Contraseña para el usuario de la base de datos.
  password               = var.password

  # Nombre del grupo de parámetros que define los valores de configuración del motor de base de datos.
  parameter_group_name   = var.parameter_group_name

  # Indica si se debe omitir el snapshot final al eliminar la base de datos.
  skip_final_snapshot    = true

  # Habilita Multi-AZ para alta disponibilidad y failover automático.
  multi_az               = true

  # Indica si la base de datos debe ser accesible públicamente.
  publicly_accessible    = false

  # IDs de los grupos de seguridad asociados a la instancia RDS.
  vpc_security_group_ids = [module.security_group.security_group_id]

  # Nombre del grupo de subredes donde se desplegará la instancia RDS.
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = var.db_name
  }
}


# ------------------------------------------------------------------
# El grupo de subredes define las subredes dentro de la VPC donde se 
# desplegarán las instancias de base de datos RDS.
# ------------------------------------------------------------------

resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"

  # Lista de IDs de subredes privadas donde se desplegarán las instancias RDS.
  subnet_ids = var.private_subnet_ids
}


