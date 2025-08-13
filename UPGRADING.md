# Upgrading Notes

This document captures required refactoring on your part when upgrading to a module version that contains breaking changes.

## Upgrading to v2.0.0

### Key Changes

- CloudWatch log configuration has now moved out of the root module and included in the submodule that a user can call it seperately.
- Introducing a submodule to create resolver rules directly from this module.

#### Variables

The following variables have been added as part of sub modules:

Submodule: resolver-rules

`resolver_endpoint_id`: The ID of the Route 53 resolver endpoint.
`resolver_rules`: Map of resolver rule definitions.
`rule_type`: The rule type for the resolver rule (usually FORWARD). Default value is FORWARD.
`target_ips`: List of IP addresses for the target IPs.

Submodule: resolver-logging
`cloudwatch_logging_configuration`: Cloudwatch logs configuration, including KMS key ARN.
`vpc_id`: The ID of the VPC where the resolver endpoint will be created and logging will be associated.


### How to upgrade v5.0.0

The Cloudwatch log resources has been moved to a seperate submodule.
you can call the module for creating the cloudwatch log and move your existing resources.



if you already have the resolver rule created and you would like to move them to the module then ensure that you move your resources to the module.

```hcl
moved {
  from = module.outbound_resolver_endpoints.aws_route53_resolver_query_log_config.resolver_query_log_config_cloudwatch
  to   = module.route53_resolver_logging.aws_route53_resolver_query_log_config.resolver_query_log_config_cloudwatch[0]
}

moved {
  from = module.outbound_resolver_endpoints.aws_route53_resolver_query_log_config_association.resolver_query_config_cloudwatch_association
  to   = module.route53_resolver_logging.aws_route53_resolver_query_log_config_association.resolver_query_config_cloudwatch_association[0]
}

moved {
  from = module.outbound_resolver_endpoints.aws_cloudwatch_log_group.resolver_query_logs
  to   = module.route53_resolver_logging.aws_cloudwatch_log_group.resolver_query_logs[0]
}
```


```hcl
moved {
  from = aws_route53_resolver_rule.outbound_forwarding_rule["outbound-example"]
  to   = module.route53_resolver_rule.aws_route53_resolver_rule.resolver_rules["outbound-example"]
}
```