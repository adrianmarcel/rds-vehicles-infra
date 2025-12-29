provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "vehicles_rds" {
  identifier             = "vehicles-rds"
  allocated_storage      = 10 
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t4g.micro"
  username               = var.db_username
  password               = var.db_password
  db_name                = "vehicles_db"
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  deletion_protection    = false
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Permitir acesso ao banco apenas de dentro da VPC"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}
