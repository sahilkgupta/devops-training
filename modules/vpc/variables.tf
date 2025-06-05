variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  type = map(string)
  default = {
    "eu-west-2a" = "10.0.1.0/24"
    "eu-west-2b" = "10.0.2.0/24"
    "eu-west-2c" = "10.0.3.0/24"
  }
}

variable "public_subnets" {
  type = map(string)
  default = {
    "eu-west-2a" = "10.0.4.0/24"
    "eu-west-2b" = "10.0.5.0/24"
    "eu-west-2c" = "10.0.6.0/24"
  }
}