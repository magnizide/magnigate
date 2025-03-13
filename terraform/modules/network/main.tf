resource "google_compute_network" "vpc_network" {
  name                    = format("%s-%s-%s-vpc-network", var.service_name, var.region, terraform.workspace)
  description             = format("VPC Network provided for *%s* functionality", terraform.workspace)
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = format("%s-%s-%s-subnet", var.service_name, var.region, terraform.workspace)
  region        = var.region
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = var.ip_range
  # gateway_address = "${var.gw_addr}" Cannot be defined automatically uses first avail IP.
}

resource "google_compute_firewall" "firewall_rules" {
  count = length(var.fw_rules_desc)

  name          = format("%s-%s-%s-fwrules-%d", var.service_name, var.region, terraform.workspace, count.index)
  network       = google_compute_network.vpc_network.name
  description   = var.fw_rules_desc[count.index]
  source_ranges = var.fw_rules_src_r[count.index]
  target_tags   = var.fw_rules_target_tags[count.index]
  allow {
    protocol = var.fw_rules_proto[count.index]
    ports    = var.fw_rules_ports[count.index]
  }
}

resource "google_compute_address" "external_static" {
  name         = format("%s-%s-%s-pub-ip", var.service_name, var.region, terraform.workspace)
  address_type = "EXTERNAL"
  network_tier = "STANDARD"
  region       = var.region
  project      = var.project_id
  description  = format("Static Public IP for %s PROJECT", var.project_id)
}
