module "network" {
  source         = "./modules/network"
  service_name   = var.service_name
  project_id     = var.project_id
  ip_range       = var.ip_range
  fw_rules_desc  = var.fw_rules_desc
  fw_rules_src_r = var.fw_rules_src_r
  fw_rules_proto = var.fw_rules_proto
  fw_rules_ports = var.fw_rules_ports
  compute_tags   = var.compute_tags
}

module "compute" {
  source                  = "./modules/compute"
  service_name            = var.service_name
  project_id              = var.project_id
  compute_tags            = var.compute_tags
  subnet_id               = module.network.subnet_id
  external_static_address = module.network.external_static_address
}
