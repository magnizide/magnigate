module "network" {
  source               = "./modules/network"
  service_name         = var.service_name
  project_id           = var.project_id
  ip_range             = var.ip_range
  fw_rules_desc        = var.fw_rules_desc
  fw_rules_src_r       = var.fw_rules_src_r
  fw_rules_proto       = var.fw_rules_proto
  fw_rules_ports       = var.fw_rules_ports
  fw_rules_target_tags = var.fw_rules_target_tags
}

module "compute" {
  source                  = "./modules/compute"
  service_name            = var.service_name
  project_id              = var.project_id
  subnet_id               = module.network.subnet_id
  external_static_address = module.network.external_static_address
  fw_rules_target_tags    = var.fw_rules_target_tags
  service_account_email   = module.iam.service_account_email
}

module "registrar" {
  source               = "./modules/registrar"
  record_ip            = module.network.external_static_address
  record_name          = var.record_name
  cloudflare_zone_id   = var.cloudflare_zone_id
  cloudflare_api_token = var.cloudflare_api_token
}

module "iam" {
  source            = "./modules/iam"
  certs_bucket_name = var.certs_bucket_name
  service_name      = var.service_name
  project_id        = var.project_id
}

