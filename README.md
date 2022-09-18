# **Simple Module to create a Compute Engine instance with Nginx**

This module creates a Compute Engine instance with the needed configuration to have a nginx server up and running.

### **THIS IS A DEV MODULE DO NOT USE IT IN PRODUCTION**

---

## Architecture

![Arq,use](https://raw.githubusercontent.com/paul-cruz/terraform-gcp-nginx-server/main/assets/architecture-diagram.png)

### Example of use

1. Set your **local variables**

```hcl
locals {
  project_id        = "<PROJECT-ID>"
  vpc_name          = "<VPC-NAME>"
  vpc_public_subnet = "<CIDR-FOR-THE-PUBLIC-SUBNET>"
  region            = "<REGION>"
  local_machine_ip  = "<YOUR-PUBLIC-IP-TO-SSH>"
  ssh_key           = "ssh-rsa <PUBLIC-RSA-KEY> user@host"
  ssh_username      = "user"
  instance_type     = "<INSTANCE-TYPE>"
  server_name       = "<ServerName>"
}
```

2. Use the [simple example](example/main.tf)

```hcl
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
```

---

Remember this is a dev module, **_Do not use it in production_**
