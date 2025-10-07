output "instance_public_ip" {
  description = "IP pública del servidor web"
  value       = module.compute.instance_ip
}