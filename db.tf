module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "wordpress"

  engine            = "mysql"
  engine_version    = "5.7.25"
  instance_class    = "db.t3.small"
  allocated_storage = 5

  db_name  = "wordpress"
  username = "user"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.mysql_sg.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"
}