variable "security_policy_name" {
  description = "Nombre de la política de Cloud Armor"
  type        = string
  default     = "block-ip-policy"
}

variable "blocked_ip" {
  description = "Dirección IP a bloquear"
  type        = string
  default     = "192.168.0.1"
}
