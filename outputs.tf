output "route53_resolver_endpoint_id" {
  description = "The ID of the Resolver Endpoint"
  value       = aws_route53_resolver_endpoint.default.id
}

output "route53_resolver_endpoint_arn" {
  description = "The ARN of the Resolver Endpoint"
  value       = aws_route53_resolver_endpoint.default.arn
}

output "route53_resolver_endpoint_host_vpc_id" {
  description = "The VPC ID used by the Resolver Endpoint"
  value       = aws_route53_resolver_endpoint.default.host_vpc_id
}

output "route53_resolver_endpoint_security_group_ids" {
  description = "Security Group IDs mapped to Resolver Endpoint"
  value       = aws_route53_resolver_endpoint.default.security_group_ids
}

output "route53_resolver_endpoint_ip_addresses" {
  description = "Resolver Endpoint IP Addresses"
  value       = aws_route53_resolver_endpoint.default.ip_address
}
