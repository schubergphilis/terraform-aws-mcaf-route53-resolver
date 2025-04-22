# terraform-aws-mcaf-route53-resolver

Terraform module to create Route53 resolver. This will be useful when creating the Route53 Resolver either inbound or outbound.

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | schubergphilis/mcaf-security-group/aws | ~> 2.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.resolver_query_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_route53_resolver_endpoint.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |
| [aws_route53_resolver_query_log_config.resolver_query_log_config_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config) | resource |
| [aws_route53_resolver_query_log_config_association.resolver_query_config_cloudwatch_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config_association) | resource |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The resolver endpoint name | `string` | n/a | yes |
| <a name="input_cloudwatch_logging_configuration"></a> [cloudwatch\_logging\_configuration](#input\_cloudwatch\_logging\_configuration) | Cloudwatch logs configuration | <pre>object({<br/>    kms_key_arn       = string<br/>    log_group_name    = optional(string, "/platform/route53/resolver-query-logs")<br/>    retention_in_days = optional(number, 90)<br/>    vpc_id            = string<br/>  })</pre> | `null` | no |
| <a name="input_direction"></a> [direction](#input\_direction) | The resolver endpoint flow direction | `string` | `"INBOUND"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | A list of IP addresses and subnets where Route53 resolver endpoints will be deployed | <pre>list(object({<br/>    ip        = optional(string)<br/>    subnet_id = string<br/>  }))</pre> | `[]` | no |
| <a name="input_protocols"></a> [protocols](#input\_protocols) | The resolver endpoint protocols | `list(string)` | <pre>[<br/>  "Do53",<br/>  "DoH"<br/>]</pre> | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | Route53 Resolver Endpoint Security Group, allows port 53 for DNS resolving | `string` | `null` | no |
| <a name="input_security_group_egress_cidr_blocks"></a> [security\_group\_egress\_cidr\_blocks](#input\_security\_group\_egress\_cidr\_blocks) | A list of CIDR blocks to allow on security group egress rules | `list(string)` | `[]` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group IDs | `list(string)` | `[]` | no |
| <a name="input_security_group_ingress_cidr_blocks"></a> [security\_group\_ingress\_cidr\_blocks](#input\_security\_group\_ingress\_cidr\_blocks) | A list of CIDR blocks to allow on security group ingress rules | `list(string)` | `[]` | no |
| <a name="input_security_group_name_prefix"></a> [security\_group\_name\_prefix](#input\_security\_group\_name\_prefix) | The prefix of the security group | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnets where Route53 resolver endpoints will be deployed | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags for the Route53 resolver endpoint | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | The resolver endpoint IP type | `string` | `"IPV4"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_resolver_endpoint_arn"></a> [route53\_resolver\_endpoint\_arn](#output\_route53\_resolver\_endpoint\_arn) | The ARN of the Resolver Endpoint |
| <a name="output_route53_resolver_endpoint_host_vpc_id"></a> [route53\_resolver\_endpoint\_host\_vpc\_id](#output\_route53\_resolver\_endpoint\_host\_vpc\_id) | The VPC ID used by the Resolver Endpoint |
| <a name="output_route53_resolver_endpoint_id"></a> [route53\_resolver\_endpoint\_id](#output\_route53\_resolver\_endpoint\_id) | The ID of the Resolver Endpoint |
| <a name="output_route53_resolver_endpoint_ip_addresses"></a> [route53\_resolver\_endpoint\_ip\_addresses](#output\_route53\_resolver\_endpoint\_ip\_addresses) | Resolver Endpoint IP Addresses |
| <a name="output_route53_resolver_endpoint_security_group_ids"></a> [route53\_resolver\_endpoint\_security\_group\_ids](#output\_route53\_resolver\_endpoint\_security\_group\_ids) | Security Group IDs mapped to Resolver Endpoint |
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-route53-resolver/blob/master/LICENSE) for full details.
