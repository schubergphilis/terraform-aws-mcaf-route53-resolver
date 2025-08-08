output "resolver_rule_ids" {
  description = "Map of resolver rule IDs."
  value = {
    for k, rule in aws_route53_resolver_rule.resolver_rules :
    k => rule.id
  }
}

output "resolver_rule_arns" {
  description = "Map of resolver rule arns."
  value = {
    for k, rule in aws_route53_resolver_rule.resolver_rules :
    k => rule.arn
  }
}
