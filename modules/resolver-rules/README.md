# terraform-aws-mcaf-route53-resolver-rules

Terraform submodule to create Route53 Resolver rules.  
This module creates resolver rules for forwarding DNS queries using specified target IPs.

IMPORTANT: We do not pin module versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | >= 5.32 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 5.32 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_rule.resolver_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name_prefix](#input_name_prefix) | Prefix to use for resolver rule names. | `string` | `"outbound-"` | no |
| <a name="input_resolver_endpoint_id"></a> [resolver_endpoint_id](#input_resolver_endpoint_id) | The ID of the Route 53 resolver endpoint. | `string` | n/a | yes |
| <a name="input_resolver_rules"></a> [resolver_rules](#input_resolver_rules) | List of resolver rule domain names to create rules for. | `list(string)` | n/a | yes |
| <a name="input_rule_type"></a> [rule_type](#input_rule_type) | The rule type for the resolver rule (usually FORWARD). | `string` | `"FORWARD"` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags to apply to the resolver rules. | `map(string)` | `{}` | no |
| <a name="input_target_ips"></a> [target_ips](#input_target_ips) | List of IP addresses for the target IPs. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resolver_rule_ids"></a> [resolver_rule_ids](#output_resolver_rule_ids) | Map of resolver rule IDs, keyed by domain name. |
| <a name="output_resolver_rule_arns"></a> [resolver_rule_arns](#output_resolver_rule_arns) | Map of resolver rule ARNs, keyed by domain name. |

<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0.  
See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-route53-resolver/blob/master/LICENSE) for full details.
