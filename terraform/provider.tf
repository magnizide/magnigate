terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.25.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east1"
  zone    = "us-east1-b"
}

provider "tls" {}


