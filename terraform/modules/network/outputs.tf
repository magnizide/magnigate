output "vpc_id" {
  value       = google_compute_network.vpc_network.id
  description = "GCP identifier for Service vpc."
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "GCP identifier for Service subnet."
}

output "external_static_address" {
  value       = google_compute_address.external_static.address
  sensitive   = true
  description = "Public IP address."
}

