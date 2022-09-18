output "custom_vpc" {
  description = "Google VPC Object"
  value       = module.custom_vpc
}

output "firewall_tag" {
  description = "Firewall tag to allow HTTP traffic"
  value       = local.firewall_tag
}
