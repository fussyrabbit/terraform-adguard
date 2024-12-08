resource "adguard_config" "this" {
  filtering = {
    update_interval = var.filtering_update_interval
  }

  safesearch = {
    enabled  = var.safesearch_enabled
    services = var.safesearch_services
  }

  querylog = {
    enabled             = var.querylog_enabled
    interval            = var.querylog_interval
    anonymize_client_ip = var.anonymize_client_ip
  }

  stats = {
    enabled  = var.stats_enabled
    interval = var.stats_interval
  }

  dns = {
    upstream_dns     = var.upstream_dns
    rate_limit       = var.rate_limit
    cache_ttl_min    = var.ttl_min
    cache_ttl_max    = var.ttl_max
    cache_optimistic = var.cache_optimistic
    blocking_mode    = var.blocking_mode
    bootstrap_dns    = var.bootstrap_dns
    allowed_clients  = var.allowed_clients
  }

  dhcp = {
    enabled   = var.dhcp_enabled
    interface = var.dhcp_interface

    ipv4_settings = {
      gateway_ip     = var.dhcp_settings.gateway_ip
      subnet_mask    = var.dhcp_settings.subnet_mask
      range_start    = var.dhcp_settings.range_start
      range_end      = var.dhcp_settings.range_end
      lease_duration = var.dhcp_settings.lease_duration
    }

    static_leases = var.static_leases
  }
}

resource "adguard_rewrite" "this" {
  for_each = try({ for index, dns in var.rewrite_dns : dns.domain => dns }, {})
  domain   = lookup(each.value, "domain", null)
  answer   = lookup(each.value, "answer", null)
}