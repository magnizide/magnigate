variable "project_id" {
  type        = string
  description = "GCP Project to use."
}

variable "region" {
  type        = string
  description = "GCP region to use."
  default     = "us-east1"
}

variable "zone" {
  type        = string
  description = "GCP zone to use."
  default     = "us-east1-b"
}

variable "service_name" {
  type        = string
  description = "MagniOps Specific Project Name."
}

# Network Module Vars

variable "ip_range" {
  type        = string
  description = "FrontGate defined big range."
}

variable "fw_rules_desc" {
  type        = list(string)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_src_r" {
  type        = list(any)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_target_tags" {
  type        = list(any)
  description = "Targets to apply the rules on."
}

variable "fw_rules_proto" {
  type        = list(string)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_ports" {
  type        = list(any)
  description = "Contains specific rules for the vpc network."
}

# Cloudflare variables
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
  type        = string
}

# IAM module vars
variable "bucket_name" {
  type        = string
  description = "Bucket from where to pull needed files."
}
