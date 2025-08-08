resource "aws_route53_resolver_rule" "resolver_rules" {
  for_each = toset(var.resolver_rules)

  domain_name          = each.value
  name                 = "${var.name_prefix}${each.value}"
  rule_type            = var.rule_type
  resolver_endpoint_id = var.resolver_endpoint_id
  tags                 = var.tags

  dynamic "target_ip" {
    for_each = var.target_ips
    content {
      ip = target_ip.value
    }
  }
}
