module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}