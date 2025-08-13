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
  resource_id                  = var.vpc_id
}
