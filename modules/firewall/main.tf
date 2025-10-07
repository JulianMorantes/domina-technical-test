resource "google_compute_firewall" "allow_http_https" {
  name    = var.rule_name
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.target_tag]
}