terraform {
  required_version = ">= 1.3.0"
  backend "s3" {
    bucket         = "2-tier-terraform-bucket"  #Manually created bucket in s3
    key            = "2tier-architecture"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"   #dynamodb is used for state-locking like no other operation will interrupt
    encrypt        = true
  }
}
 
provider "aws" {
  region = var.region
}
 
module "vpc" {
  source = "./modules/vpc"
 
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}
 
module "ec2" {
  source             = "./modules/ec2"
  public_subnet_ids  = module.vpc.public_subnet_ids
  vpc_id             = module.vpc.vpc_id
  instance_count     = var.instance_count
  instance_type      = var.instance_type
  web_security_group = module.vpc.web_security_group
  key_name           = var.key_name 
}

 
module "rds" {
  source            = "./modules/rds"
  private_subnets   = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id
  db_subnet_group   = module.vpc.db_subnet_group
  rds_security_group = module.vpc.db_security_group
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
}
