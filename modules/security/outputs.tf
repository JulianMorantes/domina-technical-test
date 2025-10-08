output "security_policy_id" {
  description = "ID de la política de Cloud Armor creada"
  value       = google_compute_security_policy.block_ip_policy.id
}