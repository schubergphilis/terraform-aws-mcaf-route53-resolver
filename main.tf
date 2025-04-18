locals {
  security_group_ids = var.security_group_name_prefix != null ? [module.security_group[0].id] : var.security_group_ids
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
  count = var.security_group_name_prefix != null ? 1 : 0

  source  = "schubergphilis/mcaf-security-group/aws"
  version = "~> 2.0.0"

  description = var.security_group_description
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

resource "aws_cloudwatch_log_group" "resolver_query_logs" {
  count = var.cloudwatch_logging_configuration != null ? 1 : 0

  name              = var.cloudwatch_logging_configuration.log_group_name
  kms_key_id        = var.cloudwatch_logging_configuration.kms_key_arn
  retention_in_days = var.cloudwatch_logging_configuration.retention_in_days
}

resource "aws_route53_resolver_query_log_config" "resolver_query_log_config_cloudwatch" {
  count = var.cloudwatch_logging_configuration != null ? 1 : 0

  name            = "resolver_query_log_config_cloudwatch"
  destination_arn = aws_cloudwatch_log_group.resolver_query_logs[0].arn
}

resource "aws_route53_resolver_query_log_config_association" "resolver_query_config_cloudwatch_association" {
  count = var.cloudwatch_logging_configuration != null ? 1 : 0

  resolver_query_log_config_id = aws_route53_resolver_query_log_config.resolver_query_log_config_cloudwatch[0].id
  resource_id                  = var.cloudwatch_logging_configuration.vpc_id
}
