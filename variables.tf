variable "rewrite_dns" {
  type = list(object({
    domain = string
    answer = string
  }))
  default     = null
  description = "List of domain and answers for rewrite dns query"
}

variable "dhcp_enabled" {
  type        = bool
  default     = false
  description = "Whether the DHCP server is enabled"
}

variable "dhcp_interface" {
  type        = string
  default     = "eth1"
  description = "The interface to use for the DHCP server"
}

variable "dhcp_settings" {
  type = object({
    gateway_ip     = string
    subnet_mask    = string
    range_start    = string
    range_end      = string
    lease_duration = number
  })
  description = "DHCP server settings"
  default = {
    gateway_ip     = "10.0.1.1"
    subnet_mask    = "255.255.255.0"
    range_start    = "10.0.1.90"
    range_end      = "10.0.1.100"
    lease_duration = 7200
  }
}

variable "static_leases" {
  description = "Client static sessions on DHCP server"
  type = list(object({
    hostname = string
    ip       = string
    mac      = string
  }))
  default = null
}

variable "upstream_dns" {
  description = "Upstream DNS servers"
  type        = list(string)
  default     = ["https://dns.cloudflare.com/dns-query"]
}

variable "bootstrap_dns" {
  description = "Bootstrap DNS servers"
  type        = list(string)
  default     = ["8.8.8.8"]
}

variable "allowed_clients" {
  description = "Allowlist of clients IP, CIDR"
  type        = list(string)
  default     = null
}

variable "blocking_mode" {
  description = "DNS response sent when request is blocked"
  type        = string
  default     = "default"
}

variable "cache_optimistic" {
  type        = bool
  description = "Enable optimistic DNS caching"
  default     = false
}

variable "stats_enabled" {
  type        = bool
  description = "Enable statistics"
  default     = true
}

variable "stats_interval" {
  type        = number
  description = "Time period for server statistics rotation"
  default     = 24
}

variable "ttl_min" {
  type        = number
  default     = 0
  description = "Overridden minimum TTL (in seconds) received from upstream DNS servers"
}

variable "ttl_max" {
  type        = number
  default     = 0
  description = " Overridden maximum TTL (in seconds) received from upstream DNS servers"
}
variable "rate_limit" {
  type        = number
  default     = 20
  description = "The number of requests per second allowed per client"
}

variable "querylog_enabled" {
  type        = bool
  description = "Enable querylog"
  default     = true
}

variable "querylog_interval" {
  type        = number
  description = "Time period for query log rotation"
  default     = 24
}

variable "anonymize_client_ip" {
  type        = bool
  default     = false
  description = "Whether anonymizing clients' IP addresses is enabled"
}

variable "safesearch_enabled" {
  type        = bool
  default     = false
  description = "Whether safesearch is enabled"
}

variable "safesearch_services" {
  type        = list(string)
  default     = ["google"]
  description = "Services which SafeSearch is enabled"
}

variable "filtering_update_interval" {
  type        = number
  default     = 24
  description = "Update interval for all list-based filters"
}