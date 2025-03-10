provider "aws" {
  region = "eu-west-1"
}

# Example to create the Route53 Inbound Resolver.
module "inbound_resolver_endpoints" {
  source = "../.."

  direction                          = "INBOUND"
  name                               = "resolver-endpoints-example"
  protocols                          = ["Do53", "DoH"]
  security_group_ingress_cidr_blocks = module.vpc.vpc_cidr_block
  security_group_name_prefix         = "resolver-endpoints-example-"
  subnet_ids                         = module.vpc.private_subnets
  vpc_id                             = module.vpc.vpc_id
}

# Example to create the Route53 Outbound Resolver
module "outbound_resolver_endpoints" {
  source = "../.."

  direction                          = "OUTBOUND"
  name                               = "resolver-endpoints-example"
  protocols                          = ["Do53", "DoH"]
  security_group_ingress_cidr_blocks = module.vpc.vpc_cidr_block
  security_group_name_prefix         = "resolver-endpoints-example-"
  subnet_ids                         = module.vpc.private_subnets
  vpc_id                             = module.vpc.vpc_id
}
