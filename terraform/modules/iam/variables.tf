variable "project_id" {
  type        = string
  description = "GCP Project to use."
}

variable "service_name" {
  type        = string
  description = "MagniOps Specific Project Name."
}

variable "bucket_name" {
  type        = string
  description = "Bucket from where to pull needed files."
}
