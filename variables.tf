variable "direction" {
  type        = string
  default     = "INBOUND"
  description = "The resolver endpoint flow direction"
}

variable "ip_address" {
  type = list(object({
    ip        = optional(string)
    subnet_id = string
  }))
  default     = []
  description = "A list of IP addresses and subnets where Route53 resolver endpoints will be deployed"
}

variable "name" {
  type        = string
  description = "The resolver endpoint name"
}

variable "protocols" {
  type        = list(string)
  default     = ["Do53", "DoH"]
  description = "The resolver endpoint protocols"
}

variable "security_group_description" {
  type        = string
  default     = null
  description = "Route53 Resolver Endpoint Security Group, allows port 53 for DNS resolving"
}

variable "security_group_egress_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "A list of CIDR blocks to allow on security group egress rules"

  validation {
    condition = !(
      length(var.security_group_ids) == 0 &&
      var.direction == "OUTBOUND" &&
      length(var.security_group_egress_cidr_blocks) == 0
    )
    error_message = "'security_group_egress_cidr_blocks' must be set when 'security_group_ids' is not set and 'direction' is set to 'OUTBOUND'"
  }
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "A list of security group IDs, if not specified a default security group will be created"
}

variable "security_group_ingress_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "A list of CIDR blocks to allow on security group ingress rules"

  validation {
    condition = !(
      length(var.security_group_ids) == 0 &&
      var.direction == "INBOUND" &&
      length(var.security_group_ingress_cidr_blocks) == 0
    )
    error_message = "'security_group_ingress_cidr_blocks' must be set when 'security_group_ids' is not set and 'direction' is set to 'INBOUND'"
  }
}

variable "security_group_name_prefix" {
  type        = string
  default     = "route53-resolver-"
  description = "The prefix of the security group"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "A list of subnets where Route53 resolver endpoints will be deployed"

  validation {
    condition     = length(var.subnet_ids) == 0 || length(var.ip_address) == 0
    error_message = "Either 'subnet_ids' or 'ip_address' can be defined."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags for the Route53 resolver endpoint"
}

variable "type" {
  type        = string
  default     = "IPV4"
  description = "The resolver endpoint IP type"
}
