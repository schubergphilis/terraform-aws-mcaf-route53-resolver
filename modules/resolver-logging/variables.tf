variable "cloudwatch_logging_configuration" {
  type = object({
    kms_key_arn       = string
    log_group_name    = optional(string, "/platform/route53/resolver-query-logs")
    retention_in_days = optional(number, 90)
  })
  description = "Cloudwatch logs configuration"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the resolver endpoint will be created and logging will be associated"
}
