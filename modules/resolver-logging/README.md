# terraform-aws-mcaf-route53-resolver-logging

Terraform submodule to enable **CloudWatch logging** for a Route53 Resolver endpoint.  
This creates the CloudWatch log group, query log configuration, and associates it with a VPC.

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
| [aws_cloudwatch_log_group.resolver_query_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_route53_resolver_query_log_config.resolver_query_log_config_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config) | resource |
| [aws_route53_resolver_query_log_config_association.resolver_query_config_cloudwatch_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_logging_configuration"></a> [cloudwatch\_logging\_configuration](#input\_cloudwatch\_logging\_configuration) | Cloudwatch logs configuration | <pre>object({<br/>    kms_key_arn       = string<br/>    log_group_name    = optional(string, "/platform/route53/resolver-query-logs")<br/>    retention_in_days = optional(number, 90)<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where the resolver endpoint will be created and logging will be associated | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0.  
See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-route53-resolver/blob/master/LICENSE) for full details.