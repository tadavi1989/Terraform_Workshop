resource "aws_key_pair" "admin_key" {
  key_name = var.environment
  public_key = "${file("${path.module}/keys/admin.pub")}"

}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
tags = { Name = "${var.environment}-vpc" }
}