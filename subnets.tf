resource "aws_subnet" "private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(split(",", var.private_subnets), count.index)
  availability_zone = element(split(",", var.azs), count.index)
  count = length(compact(split(",", var.private_subnets)))
  tags = { Name = "${var.environment}-private" }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(split(",", var.public_subnets), count.index)
  availability_zone = element(split(",", var.azs), count.index)
  count = length(compact(split(",", var.public_subnets)))
  tags = { Name = "${var.environment}-public" }

  map_public_ip_on_launch = true
}
