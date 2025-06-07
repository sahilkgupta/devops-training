variable "private_subnets" {
  description = "List of private subnets for the RDS instance"
  type        = list(string)
}
 
variable "vpc_id" {
  description = "VPC ID where the RDS instance will be created"
  type        = string
}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}
variable "db_subnet_group" {}
variable "rds_security_group" {}