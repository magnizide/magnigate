# Provided Network Module vars
ip_range = "10.11.12.0/28"

# Firewall vars
fw_rules_desc = [
  "Allows internet incoming traffict to http ssl port.",
  "Allows internet incoming traffic on ssh port port. Temporarily."
]
fw_rules_src_r = [
  ["0.0.0.0/0"],
  ["0.0.0.0/0"]
]
fw_rules_target_tags = [
  ["proxy"],
  ["ssh-port-enabled"]
]
fw_rules_proto = [
  "tcp",
  "tcp"
]
fw_rules_ports = [
  [443, 80, 51820],
  [22]
]