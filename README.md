# AdGuard Home Terraform module
---
Simple terraform module which manage AdGuard Home DNS server.

## Documentation
This module use [gmichels/terraform-provider-adguard](https://github.com/gmichels/terraform-provider-adguard) provider. Most of options can be found in provider terraform registry [page](https://registry.terraform.io/providers/gmichels/adguard/latest/docs). Before you start don't forget setup environment variables for connect to AdGuadrd Home.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_adguard"></a> [adguard](#requirement\_adguard) | 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_adguard"></a> [adguard](#provider\_adguard) | 1.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [adguard_config.this](https://registry.terraform.io/providers/gmichels/adguard/1.3.0/docs/resources/config) | resource |
| [adguard_rewrite.this](https://registry.terraform.io/providers/gmichels/adguard/1.3.0/docs/resources/rewrite) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_clients"></a> [allowed\_clients](#input\_allowed\_clients) | Allowlist of clients IP, CIDR | `list(string)` | `null` | no |
| <a name="input_anonymize_client_ip"></a> [anonymize\_client\_ip](#input\_anonymize\_client\_ip) | Whether anonymizing clients' IP addresses is enabled | `bool` | `false` | no |
| <a name="input_blocking_mode"></a> [blocking\_mode](#input\_blocking\_mode) | DNS response sent when request is blocked | `string` | `"default"` | no |
| <a name="input_bootstrap_dns"></a> [bootstrap\_dns](#input\_bootstrap\_dns) | Bootstrap DNS servers | `list(string)` | <pre>[<br/>  "8.8.8.8"<br/>]</pre> | no |
| <a name="input_cache_optimistic"></a> [cache\_optimistic](#input\_cache\_optimistic) | Enable optimistic DNS caching | `bool` | `false` | no |
| <a name="input_dhcp_enabled"></a> [dhcp\_enabled](#input\_dhcp\_enabled) | Whether the DHCP server is enabled | `bool` | `false` | no |
| <a name="input_dhcp_interface"></a> [dhcp\_interface](#input\_dhcp\_interface) | The interface to use for the DHCP server | `string` | `"eth1"` | no |
| <a name="input_dhcp_settings"></a> [dhcp\_settings](#input\_dhcp\_settings) | DHCP server settings | <pre>object({<br/>    gateway_ip     = string<br/>    subnet_mask    = string<br/>    range_start    = string<br/>    range_end      = string<br/>    lease_duration = number<br/>  })</pre> | <pre>{<br/>  "gateway_ip": "10.0.1.1",<br/>  "lease_duration": 7200,<br/>  "range_end": "10.0.1.100",<br/>  "range_start": "10.0.1.90",<br/>  "subnet_mask": "255.255.255.0"<br/>}</pre> | no |
| <a name="input_filtering_update_interval"></a> [filtering\_update\_interval](#input\_filtering\_update\_interval) | Update interval for all list-based filters | `number` | `24` | no |
| <a name="input_querylog_enabled"></a> [querylog\_enabled](#input\_querylog\_enabled) | Enable querylog | `bool` | `true` | no |
| <a name="input_querylog_interval"></a> [querylog\_interval](#input\_querylog\_interval) | Time period for query log rotation | `number` | `24` | no |
| <a name="input_rate_limit"></a> [rate\_limit](#input\_rate\_limit) | The number of requests per second allowed per client | `number` | `20` | no |
| <a name="input_rewrite_dns"></a> [rewrite\_dns](#input\_rewrite\_dns) | List of domain and answers for rewrite dns query | <pre>list(object({<br/>    domain = string<br/>    answer = string<br/>  }))</pre> | `null` | no |
| <a name="input_safesearch_enabled"></a> [safesearch\_enabled](#input\_safesearch\_enabled) | Whether safesearch is enabled | `bool` | `false` | no |
| <a name="input_safesearch_services"></a> [safesearch\_services](#input\_safesearch\_services) | Services which SafeSearch is enabled | `list(string)` | <pre>[<br/>  "google"<br/>]</pre> | no |
| <a name="input_static_leases"></a> [static\_leases](#input\_static\_leases) | Client static sessions on DHCP server | <pre>list(object({<br/>    hostname = string<br/>    ip       = string<br/>    mac      = string<br/>  }))</pre> | `null` | no |
| <a name="input_stats_enabled"></a> [stats\_enabled](#input\_stats\_enabled) | Enable statistics | `bool` | `true` | no |
| <a name="input_stats_interval"></a> [stats\_interval](#input\_stats\_interval) | Time period for server statistics rotation | `number` | `24` | no |
| <a name="input_ttl_max"></a> [ttl\_max](#input\_ttl\_max) | Overridden maximum TTL (in seconds) received from upstream DNS servers | `number` | `0` | no |
| <a name="input_ttl_min"></a> [ttl\_min](#input\_ttl\_min) | Overridden minimum TTL (in seconds) received from upstream DNS servers | `number` | `0` | no |
| <a name="input_upstream_dns"></a> [upstream\_dns](#input\_upstream\_dns) | Upstream DNS servers | `list(string)` | <pre>[<br/>  "https://dns.cloudflare.com/dns-query"<br/>]</pre> | no |

## Outputs

No outputs.
