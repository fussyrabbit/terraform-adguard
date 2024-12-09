module "adguard" {
  source = "git::https://github.com/fussyrabbit/terraform-adguard.git?ref=v0.1.0"

  upstream_dns = [
    "tls://one.one.one.one",
    "https://dns.cloudflare.com/dns-query"
  ]

  bootstrap_dns = [
    "1.1.1.1",
    "8.8.8.8"
  ]

  rewrite_dns = [
    {
      domain = "portainer.example.com"
      answer = "192.168.100.10"
    },
    {
      domain = "jellyfin.example.com"
      answer = "portainer.example.com"
    }
  ]

  static_leases = [
    {
      hostname = "proxmox-01"
      ip       = "192.168.100.2"
      mac      = "00:e0:1f:c6:66:e5"
    }
  ]

  allowed_clients = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

  dhcp_enabled   = true
  dhcp_interface = "eth0"
  dhcp_settings = {
    gateway_ip     = "192.168.100.1"
    subnet_mask    = "255.255.255.0"
    range_start    = "192.168.100.230"
    range_end      = "192.168.100.254"
    lease_duration = 3600
  }
  anonymize_client_ip = false
}
