# terraform-aws-mcaf-route53-resolver-rules

Terraform submodule to create Route53 Resolver rules.  
This module creates resolver rules for forwarding DNS queries using specified target IPs.

IMPORTANT: We do not pin module versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.32 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.32 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_rule.resolver_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_rule) | resource |
| [aws_route53_resolver_rule_association.rule_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_rule_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resolver_endpoint_id"></a> [resolver\_endpoint\_id](#input\_resolver\_endpoint\_id) | The ID of the Route 53 resolver endpoint. | `string` | n/a | yes |
| <a name="input_resolver_rules"></a> [resolver\_rules](#input\_resolver\_rules) | Map of resolver rule definitions | `map(string)` | n/a | yes |
| <a name="input_target_ips"></a> [target\_ips](#input\_target\_ips) | List of IP addresses for the target IPs. | `list(string)` | n/a | yes |
| <a name="input_rule_type"></a> [rule\_type](#input\_rule\_type) | The rule type for the resolver rule (usually FORWARD). | `string` | `"FORWARD"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resolver rules. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the Route53 Resolver rules should be associated | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resolver_rule_arns"></a> [resolver\_rule\_arns](#output\_resolver\_rule\_arns) | Map of resolver rule arns. |
| <a name="output_resolver_rule_ids"></a> [resolver\_rule\_ids](#output\_resolver\_rule\_ids) | Map of resolver rule IDs. |
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0.  
See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-route53-resolver/blob/master/LICENSE) for full details.
