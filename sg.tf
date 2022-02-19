module "mysql_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "mysql-service"
  description = "Allows access to MySQL"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}