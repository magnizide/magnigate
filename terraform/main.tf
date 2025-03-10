module "network" {
  source = "./modules/network"

  service_name   = var.service_name
  project_id     = var.project_id
  ip_range       = var.ip_range
  gw_addr        = var.gw_addr
  sub_ip_ranges  = var.sub_ip_ranges
  fw_rules_desc  = var.fw_rules_desc
  fw_rules_src_r = var.fw_rules_src_r
  fw_rules_proto = var.fw_rules_proto
  fw_rules_ports = var.fw_rules_ports
}

