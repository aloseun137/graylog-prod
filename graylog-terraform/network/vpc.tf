resource "aws_vpc" "graylog" {
  cidr_block = var.vpc_cidr
  tags       = { Name = "graylog-vpc" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.graylog.id
  tags   = { Name = "graylog-igw" }
}
