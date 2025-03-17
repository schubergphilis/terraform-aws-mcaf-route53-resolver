# terraform-aws-mcaf-route53-resolver

Terraform module to create Route53 resolver. This will be useful when creating the Route53 Resolver either inbound or outbound.

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="security_group"></a> [security_group](#security_group) | schubergphilis/mcaf-security-group/aws | 0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_endpoint.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="create_security_group"></a> [create_security_group](#input_create_security_group) | Whether to create Security Groups for Route53 Resolver Endpoints | `bool` | `true` | no |
| <a name="direction"></a> [direction](#input_direction) | The resolver endpoint flow direction | `string` | `"INBOUND"` | no |
| <a name="ip_address"></a> [ip_address](#input_ip_address) | A list of IP addresses and subnets where Route53 resolver endpoints will be deployed | `list(object({ ip = optional(string), subnet_id = string }))` | `[]` | no |
| <a name="name"></a> [name](#input_name) | The resolver endpoint name | `string` | n/a | yes |
| <a name="protocols"></a> [protocols](#input_protocols) | The resolver endpoint protocols | `list(string)` | `[]` | no |
| <a name="security_group_description"></a> [security_group_description](#input_security_group_description) | Security group description for DNS resolver | `string` | `null` | no |
| <a name="security_group_egress_cidr_blocks"></a> [security_group_egress_cidr_blocks](#input_security_group_egress_cidr_blocks) | CIDR blocks allowed in security group egress rules | `list(string)` | n/a | no |
| <a name="security_group_ids"></a> [security_group_ids](#input_security_group_ids) | A list of security group IDs | `list(string)` | `[]` | no |
| <a name="security_group_ingress_cidr_blocks"></a> [security_group_ingress_cidr_blocks](#input_security_group_ingress_cidr_blocks) | CIDR blocks allowed in security group ingress rules | `list(string)` | n/a | no |
| <a name="security_group_name"></a> [security_group_name](#input_security_group_name) | The name of the security group | `string` | `null` | no |
| <a name="security_group_name_prefix"></a> [security_group_name_prefix](#input_security_group_name_prefix) | Prefix for the security group name | `string` | `null` | no |
| <a name="subnet_ids"></a> [subnet_ids](#input_subnet_ids) | List of subnets where Route53 resolver endpoints will be deployed | `list(string)` | `[]` | no |
| <a name="tags"></a> [tags](#input_tags) | A map of tags for the Route53 resolver endpoint | `map(string)` | `{}` | no |
| <a name="type"></a> [type](#input_type) | The resolver endpoint IP type | `string` | `"IPV4"` | no |
| <a name="vpc_id"></a> [vpc_id](#input_vpc_id) | The VPC ID for all the Route53 Resolver Endpoints | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="route53_resolver_endpoint_id"></a> [route53_resolver_endpoint_id](#output_route53_resolver_endpoint_id) | The ID of the Resolver Endpoint |
| <a name="route53_resolver_endpoint_arn"></a> [route53_resolver_endpoint_arn](#output_route53_resolver_endpoint_arn) | The ARN of the Resolver Endpoint |
| <a name="route53_resolver_endpoint_host_vpc_id"></a> [route53_resolver_endpoint_host_vpc_id](#output_route53_resolver_endpoint_host_vpc_id) | The VPC ID used by the Resolver Endpoint |
| <a name="route53_resolver_endpoint_security_group_ids"></a> [route53_resolver_endpoint_security_group_ids](#output_route53_resolver_endpoint_security_group_ids) | Security Group IDs mapped to Resolver Endpoint |
| <a name="route53_resolver_endpoint_ip_addresses"></a> [route53_resolver_endpoint_ip_addresses](#output_route53_resolver_endpoint_ip_addresses) | Resolver Endpoint IP Addresses |

<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-route53-resolver/blob/master/LICENSE) for full details.
