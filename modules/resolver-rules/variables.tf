variable "name_prefix" {
  type    = string
  default = "outbound"
}

variable "resolver_endpoint_id" {
  type        = string
  description = "The ID of the Route 53 resolver endpoint."
}

variable "resolver_rules" {
  type        = list(string)
  description = "Map of resolver rule definitions, keyed by domain."
}

variable "rule_type" {
  type        = string
  default     = "FORWARD"
  description = "The rule type for the resolver rule (usually FORWARD)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the resolver rules."
}

variable "target_ips" {
  type        = list(string)
  description = "List of IP addresses for the target IPs."
}
