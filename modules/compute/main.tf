# Obtiene la última imagen de la familia Ubuntu 2004 LTS
# Obtiene la imagen más reciente de Ubuntu 20.04 LTS del proyecto oficial
data "google_compute_image" "ubuntu" {
  name    = "ubuntu-2204-jammy-v20251002"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "web_server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    subnetwork = var.subnet_name
    access_config {}
  }

  tags = var.tags

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}