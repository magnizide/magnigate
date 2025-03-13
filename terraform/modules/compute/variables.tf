variable "service_name" {
  type        = string
  description = "MagniOps Specific Project Name."
}

variable "image_family" {
  type        = string
  description = "Base image family"
  default     = "debian-12"
}

variable "image_project" {
  type        = string
  description = "Base image project"
  default     = "debian-cloud"
}

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

variable "fw_rules_target_tags" {
  type        = list(any)
  description = "Targets to apply the rules on."
}

# Imported Module Vars

variable "subnet_id" {
  type        = string
  description = "VPC Subnet ID from the network module."
}

variable "external_static_address" {
  type        = string
  description = "External IP address ID from the network module."
}
