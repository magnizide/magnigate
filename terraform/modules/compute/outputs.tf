output "private_key" {
  value       = tls_private_key.ssh_key.private_key_openssh
  sensitive   = true
  description = "SSH private key for CM access."
}

output "public_key" {
  value       = tls_private_key.ssh_key.public_key_openssh
  sensitive   = true
  description = "SSH public key for CM access."
}

output "instance_name" {
  value       = google_compute_instance.instance.name
  description = "Name of the GCE instance."
}
