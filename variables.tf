variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 machine"
}

variable "server_name" {
  type        = string
  description = "Name for the nginx server"
}

variable "ssh_key" {
  type        = string
  description = "Public SSH key to connect to the instance"
}

variable "ssh_username" {
  type        = string
  description = "Username for the public SSH key to connect to the instance"
}

variable "vpc_name" {
  type        = string
  description = "Name for the custom VPC"
}

variable "region" {
  type        = string
  description = "Region for the resources"
}

variable "vpc_public_subnet" {
  type        = string
  description = "Cidr for the public subnet to host the server"
}

variable "local_machine_ip" {
  type        = string
  description = "Your local machine ip to connect via SSH to the server"
}
