variable "environment" {
  description = "This is mainly used to set various ideintifiers and prefixes/suffixes"
}

variable "private_subnets" {
  description = "IP prefix of private (vpc only routing) subnets"
}

variable "public_subnets" {
  description = "IP prefix of public (internet gw route) subnet"
}

variable "region" {
  type = string
}

variable "azs" { }

variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default = true
}
variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default = true
}

variable "vpc_cidr" {
  type =  string
    description = "IP prefix of main vpc"
}
