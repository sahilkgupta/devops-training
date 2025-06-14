variable "instance_count" {}
variable "instance_type" {}
//variable "public_subnets" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "web_security_group" {}
variable "vpc_id" {}

variable "key_name" {
  description = "Name of the existing key pair to connect to EC2"
  type        = string
}