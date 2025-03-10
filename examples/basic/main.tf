provider "aws" {
  region = "eu-west-1"
}

# vpc
module "vpc" {
  source              = "github.com/schubergphilis/terraform-aws-mcaf-vpc"
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
