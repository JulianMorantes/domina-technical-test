variable "instance_name" {
  description = "Nombre de la instancia"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina (e.g. e2-medium)"
  type        = string
}

variable "zone" {
  description = "Zona de despliegue"
  type        = string
}

variable "subnet_name" {
  description = "Nombre de la subred a la que se conecta la instancia"
  type        = string
}

variable "tags" {
  description = "Etiquetas de red (network tags)"
  type        = list(string)
}
