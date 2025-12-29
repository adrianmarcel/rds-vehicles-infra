variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-2"
}

variable "db_username" {
  description = "Usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}

variable "vpc_cidr" {
  description = "CIDR da VPC para permitir acesso interno"
  type        = string
  default     = "10.0.0.0/16"  # Ajuste conforme sua VPC
}
