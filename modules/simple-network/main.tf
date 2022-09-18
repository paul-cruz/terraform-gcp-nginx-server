locals {
  firewall_tag = "nginx-server"
}

module "custom_vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = var.vpc_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "public-subnet"
      subnet_ip     = var.vpc_public_subnet
      subnet_region = var.vpc_subnet_region
    }
  ]
}

resource "google_compute_firewall" "nginx_server_firewall" {
  name    = "nginx-server-firewall"
  network = module.custom_vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = [local.firewall_tag]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "nginx_ssh_firewall" {
  name    = "nginx-ssh-firewall"
  network = module.custom_vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = [local.firewall_tag]
  source_ranges = ["${var.local_machine_ip}/32"]
}
