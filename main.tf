module "network" {
  source            = "./modules/simple-network"
  project_id        = var.project_id
  vpc_name          = var.vpc_name
  vpc_subnet_region = var.region
  vpc_public_subnet = var.vpc_public_subnet
  local_machine_ip  = var.local_machine_ip
}

data "template_file" "user_data" {
  template = file("${abspath(path.module)}/startup.sh")
}

data "google_compute_zones" "available" {
  region = var.region
}

resource "google_compute_instance" "nginx_server" {
  name         = var.server_name
  machine_type = var.instance_type
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      type  = "pd-balanced"
      size  = 10
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${var.ssh_key}"
  }

  metadata_startup_script = data.template_file.user_data.rendered


  network_interface {
    network    = module.network.custom_vpc.network_name
    subnetwork = module.network.custom_vpc.subnets["${var.region}/public-subnet"].name
    access_config {
    }
  }

  tags = [module.network.firewall_tag]
}

