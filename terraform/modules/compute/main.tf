# data "template_file" "startup-script-custom" {
#    template = file("${path.root}/templates/startup-script.tpl")
#    vars = {
#        access_token		= var.access_token
#        certs_object_url   = var.certs_object_url
#        sw_object_url		= var.sw_object_url
#    }
#
#}

data "google_compute_image" "base_image" {
  family      = var.image_family
  most_recent = true
  project     = var.image_project
}

resource "google_compute_instance" "instance" {
  name           = format("%s-%s-%s-instance", var.service_name, var.region, terraform.workspace)
  machine_type   = "e2-micro"
  zone           = var.zone
  project        = var.project_id
  can_ip_forward = true
  tags           = [for tag in var.fw_rules_target_tags: tag[0]]
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
  #metadata = {
  #    startup-script      = data.template_file.startup-script-custom.rendered
  #}
}