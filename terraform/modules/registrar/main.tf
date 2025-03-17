terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0" # Or your desired version
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

locals {
  record_name_list = tolist([var.record_name, "*"])
}

resource "cloudflare_record" "a_record" {
  count = length(local.record_name_list)

  zone_id = var.cloudflare_zone_id
  name    = local.record_name_list[count.index]
  content = var.record_ip
  type    = "A"
  ttl     = 300 # 5 minutes
}
