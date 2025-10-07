terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Módulo de red
module "network" {
  source       = "./modules/network"
  vpc_name     = "web-app-vpc"
  subnet_name  = "web-app-subnet"
  region       = var.region
  subnet_cidr  = "10.0.1.0/24"
}

# Módulo de firewall
module "firewall" {
  source     = "./modules/firewall"
  vpc_name   = module.network.vpc_name
  rule_name  = "allow-http-https"
  target_tag = "web-server"
}

# Módulo de Compute Engine
module "compute" {
  source        = "./modules/compute"
  instance_name = "web-server-1"
  machine_type  = "e2-medium"
  zone          = var.zone
  subnet_name   = module.network.subnet_name
  tags          = ["web-server"]
}