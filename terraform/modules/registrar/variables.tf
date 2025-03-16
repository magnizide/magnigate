variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS edit permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "record_name" {
  description = "The name of the A record (e.g., 'www', '@', 'subdomain')"
  type        = list(string)
}

variable "record_ip" {
  description = "The IP address for the A record"
  type        = string
  sensitive   = true
}
