output "environment" {
  value = var.environment
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "admin_key_name" {
  value = aws_key_pair.admin_key.key_name
}

output "private_subnets" {
  value = [ aws_subnet.private.*.id ]
}

output "public_subnets" {
  value = [ aws_subnet.public.*.id ]
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
