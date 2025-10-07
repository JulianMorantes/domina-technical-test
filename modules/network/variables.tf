variable "vpc_name" {
  type        = string
  description = "Nombre de la VPC"
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la subred"
}

variable "region" {
  type        = string
  description = "Región donde se creará la subred"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR de la subred"
}