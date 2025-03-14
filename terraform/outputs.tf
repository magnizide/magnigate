output "private_key" {
  value     = module.compute.private_key
  sensitive = true
}

output "external_static_address" {
  value     = module.network.external_static_address
  sensitive = true
}
