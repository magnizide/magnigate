data "google_client_openid_userinfo" "me" {
}

data "google_compute_image" "base_image" {
  family      = var.image_family
  most_recent = true
  project     = var.image_project
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "google_compute_instance" "instance" {
  allow_stopping_for_update = true
  name                      = format("%s-%s-%s-instance", var.service_name, var.region, terraform.workspace)
  machine_type              = "e2-micro"
  zone                      = var.zone
  project                   = var.project_id
  can_ip_forward            = true
  tags                      = [for tag in var.fw_rules_target_tags : tag[0]]
  labels = {
    "service_name" = var.service_name
    "env"          = terraform.workspace
  }
  boot_disk {
    initialize_params {
      image = data.google_compute_image.base_image.self_link
      type  = "pd-standard"
    }
  }
  network_interface {
    subnetwork         = var.subnet_id
    subnetwork_project = var.project_id
    access_config {
      nat_ip       = var.external_static_address
      network_tier = "STANDARD"
    }
  }
  metadata = {
    "ssh-keys" = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh_key.public_key_openssh}"
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
