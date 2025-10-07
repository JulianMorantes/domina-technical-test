variable "rule_name" {
  description = "Nombre de la regla de firewall"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la red VPC a la que aplica la regla"
  type        = string
}

variable "target_tag" {
  description = "Etiqueta de destino para aplicar la regla"
  type        = string
}