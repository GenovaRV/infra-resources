# ------------------------------------------------------------------
# Un VPC o Virtual Private Cloud es como una red privada en la nube 
# de AWS donde puedes lanzar tus recursos como servidores y bases de 
# datos de forma aislada y segura.
# Dato: Cada dirección IP dentro de la subnet se asigna a un recurso
# específico (instancia EC2, DB, etc).
# ------------------------------------------------------------------

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr

  # Habilita la resoluciónn DNS para instancias dentro de la VPC
  enable_dns_support   = true

  # Habilita la asignación de nombres de host a instancias 
  # dentro de la VPC
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# ------------------------------------------------------------------
# Una Subnet es un segmento de red dentro de una VPC. Aquí estamos 
# creando múltiples subredes privadas.
# ------------------------------------------------------------------

resource "aws_subnet" "private" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.this.id

  # El CIDR subnet define el rango de direcciones IP que se utilizan en una subred
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index)

  # La instancia no se lanzará con una IP pública de forma automática
  map_public_ip_on_launch = false

  # Diferentes Zonas - Alta Disponibilidad
  availability_zone       = element(var.availability_zones, count.index % length(var.availability_zones))

  # Asignar nombre de forma dinamica
  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}


# ------------------------------------------------------------------
# Una Puerta de Enlace a Internet permite la comunicación entre 
# recursos dentro de la VPC y el Internet. (Privada - Publica)
# ------------------------------------------------------------------

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}


# ------------------------------------------------------------------
# Una Tabla de Enrutamiento define cómo se dirige el tráfico de red
# dentro de la VPC.
# ------------------------------------------------------------------

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-public"
  }
}

# ------------------------------------------------------------------
# Una Ruta en la Tabla de Enrutamiento especifica el destino del 
# tráfico de red.
# ------------------------------------------------------------------

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"  # Todo el tráfico de Internet
  gateway_id             = aws_internet_gateway.this.id
}

# ------------------------------------------------------------------
# La Asociación de la Tabla de Enrutamiento dirige el tráfico de 
# Internet hacia una subred específica dentro de tu VPC.
# ------------------------------------------------------------------

resource "aws_route_table_association" "public" {
  count          = var.subnet_count

  # Define dinámicamente los IDs de las subredes
  subnet_id      = element(aws_subnet.private[*].id, count.index)

  route_table_id = aws_route_table.public.id
}

