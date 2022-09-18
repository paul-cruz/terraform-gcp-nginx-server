variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "vpc_name" {
  type        = string
  description = "Name for the custom VPC"
}

variable "vpc_subnet_region" {
  type        = string
  description = "Region for the public subnet"
}

variable "vpc_public_subnet" {
  type        = string
  description = "Cidr for the public subnet to host the server"
}

variable "local_machine_ip" {
  type        = string
  description = "Your local machine ip to connect via SSH to the server"
}
