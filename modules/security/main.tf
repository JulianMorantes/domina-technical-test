# ======= Rol IAM personalizado para Cloud Run =======
resource "google_project_iam_custom_role" "cloudrun_custom_role" {
  role_id     = "cloudRunServiceAdmin"
  title       = "Cloud Run Service Admin"
  description = "Rol personalizado con permisos limitados para administrar servicios de Cloud Run"
  permissions = [
    "run.services.create",
    "run.services.get",
    "run.services.list",
    "run.services.update",
    "run.services.delete"
  ]
  stage = "GA"
}

# ======= Política de Cloud Armor para bloquear una IP =======
resource "google_compute_security_policy" "block_ip_policy" {
  name        = var.security_policy_name
  description = "Política para bloquear tráfico desde una IP específica"
  rule {
    action   = "deny(403)"
    priority = 1000
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = [var.blocked_ip]
      }
    }
    description = "Bloqueo de IP específica"
  }
}

# ======= Asociar Cloud Armor al servicio de Cloud Run =======
resource "google_compute_backend_service" "cloudrun_backend" {
  name                            = "cloudrun-backend"
  load_balancing_scheme           = "EXTERNAL"
  protocol                        = "HTTP"
  security_policy                 = google_compute_security_policy.block_ip_policy.id
  enable_cdn                      = false
  connection_draining_timeout_sec = 10
}
