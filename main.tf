locals {
  security_group_ids = var.create_security_group ? [module.security_group[0].id] : var.security_group_ids
  subnet_ids         = [for subnet in var.subnet_ids : { subnet_id = subnet }]
}

resource "aws_route53_resolver_endpoint" "default" {
  direction              = var.direction
  name                   = var.name
  protocols              = var.protocols
  resolver_endpoint_type = var.type
  security_group_ids     = local.security_group_ids
  tags                   = var.tags

  dynamic "ip_address" {
    for_each = length(var.ip_address) == 0 ? local.subnet_ids : var.ip_address

    content {
      ip        = lookup(ip_address.value, "ip", null)
      subnet_id = ip_address.value.subnet_id
    }
  }
}

data "aws_subnet" "selected" {
  id = length(var.ip_address) == 0 ? var.subnet_ids[0] : var.ip_address[0].subnet_id
}

module "security_group" {
  count = var.create_security_group ? 1 : 0

  source  = "schubergphilis/mcaf-security-group/aws"
  version = "~> 1.0.0"

  description = var.security_group_description
  name        = var.security_group_name
  name_prefix = var.security_group_name_prefix
  tags        = var.tags
  vpc_id      = data.aws_subnet.selected.vpc_id

  egress_rules = {
    for protocol in toset(["tcp", "udp"]) : "${protocol}-53" => {
      description = "Allow DNS for outside world"
      ip_protocol = protocol
      from_port   = 53
      to_port     = 53
      cidr_ipv4   = var.security_group_egress_cidr_blocks
    }
  }

  ingress_rules = {
    for protocol in toset(["tcp", "udp"]) : "${protocol}-53" => {
      description = "Allow DNS on port 53 for defined CIDR blocks"
      ip_protocol = protocol
      from_port   = 53
      to_port     = 53
      cidr_ipv4   = var.security_group_ingress_cidr_blocks
    }
  }
}
