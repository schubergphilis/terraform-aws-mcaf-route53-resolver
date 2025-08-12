provider "aws" {
  region = "eu-west-1"
}

# kms
module "kms_key" {
  source  = "schubergphilis/mcaf-kms/aws"
  version = "~> 0.3.0"

  name        = "kmstest"
  description = "KMS key used for encrypting all resources in the account"
  policy      = data.aws_iam_policy_document.kms_key_policy.json
}

# vpc
module "vpc" {
  source  = "schubergphilis/mcaf-vpc/aws"
  version = "~> 1.22.1"

  name                = "test"
  cidr_block          = "192.168.0.0/24"
  availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnet_bits  = 28
  private_subnet_bits = 28

  tags = {
    environment = "test"
  }
}

# Example to create the Route53 Inbound Resolver.
module "inbound_resolver_endpoints" {
  source = "../.."

  direction                          = "INBOUND"
  name                               = "resolver-endpoints-example"
  security_group_egress_cidr_blocks  = [module.vpc.cidr_block]
  security_group_ingress_cidr_blocks = [module.vpc.cidr_block]
  security_group_name_prefix         = "resolver-endpoints-example-"
  subnet_ids                         = module.vpc.private_subnet_ids
}

# Example to create the Route53 Outbound Resolver
module "outbound_resolver_endpoints" {
  source = "../.."

  direction                          = "OUTBOUND"
  name                               = "resolver-endpoints-example"
  security_group_egress_cidr_blocks  = [module.vpc.cidr_block]
  security_group_ingress_cidr_blocks = [module.vpc.cidr_block]
  security_group_name_prefix         = "resolver-endpoints-example-"
  subnet_ids                         = module.vpc.private_subnet_ids
}

# Example to create the Route53 Outbound Resolver rules
module "route53_resolver_rule" {
  source = "../../modules/resolver-rules"

  resolver_endpoint_id = module.outbound_resolver_endpoints.route53_resolver_endpoint_id
  resolver_rules = {
    "outbound-m-adds-p1" = "m-adds-p-1.example.nl"
    "outbound-m-adds-p2" = "m-adds-p-2.example.nl"
  }
  target_ips = [
    "10.1.1.1",
    "10.1.1.2"
  ]
}

# Example to create the Route53 Outbound Resolver Cloudwatch log
module "route53_resolver_logging" {
  source = "../../modules/resolver-logging"

  cloudwatch_logging_configuration = {
    kms_key_arn    = module.kms_key.arn
    log_group_name = "/ep/route53/resolver-query-logs"
  }
  vpc_id = module.vpc.id
}
