output "service_account_email" {
  value       = google_service_account.instance_sa.email
  sensitive   = true
  description = "GCE instance service_account_email."
}
