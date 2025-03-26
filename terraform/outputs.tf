output "private_key" {
  value       = module.compute.private_key
  sensitive   = true
  description = "SSH Key for CM provisioning."
}

output "external_static_address" {
  value       = module.network.external_static_address
  sensitive   = true
  description = "Service Public IP."
}

output "instance_name" {
  value       = module.compute.instance_name
  description = "Name of the GCE instance"
}
