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
    default     = "magnigate"
}

# Network Module Vars

variable "ip_range" {
    type        = string
    description = "FrontGate defined big range."
}

variable "gw_addr" {
    type        = string
    description = "Gateway for the defined big range (make sure it is the last usable address)."
}

variable "sub_ip_ranges" {
    type        = list(string)
    description = "List of ip ranges contanined in (ip_range)."
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
