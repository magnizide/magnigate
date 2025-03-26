variable "service_name" {
  type        = string
  description = "Project Name."
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

# Network Module Vars

variable "ip_range" {
  type        = string
  description = "CIDR range."
}

variable "fw_rules_desc" {
  type        = list(string)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_src_r" {
  type        = list(any)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_proto" {
  type        = list(string)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_ports" {
  type        = list(any)
  description = "Contains specific rules for the vpc network."
}

variable "fw_rules_target_tags" {
  type        = list(any)
  description = "Targets to apply the rules on."
}

