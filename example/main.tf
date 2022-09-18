locals {
  project_id        = "my-project-15616160"
  vpc_name          = "nginx-server-vpc"
  vpc_public_subnet = "10.128.0.0/20"
  region            = "us-central1"
  local_machine_ip  = "X.X.X.X"
  ssh_key           = "ssh-rsa ... paul@paul-pc"
  ssh_username      = "paul"
  instance_type     = "e2-micro"
  server_name       = "nginx-server-example"
}

module "nginx_server" {
  source            = "../"
  project_id        = local.project_id
  region            = local.region
  vpc_name          = local.vpc_name
  vpc_public_subnet = local.vpc_public_subnet
  local_machine_ip  = local.local_machine_ip
  ssh_key           = local.ssh_key
  ssh_username      = local.ssh_username
  instance_type     = local.instance_type
  server_name       = local.server_name
}
