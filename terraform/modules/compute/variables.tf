variable "service_name" {
    type        = string
    description = "MagniOps Specific Project Name."
    default     = "magnigate"
}

variable "image_family" {
	type		= string
	description	= "Base image family"
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

# Imported Module Vars

variable "subnet_id" {
    type        = string
    description = "VPC Subnet ID from the network module."
}

variable "external_static_address" {
    type        = string
    description = "External IP address ID from the network module."
}
