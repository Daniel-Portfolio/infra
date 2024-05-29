resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = local.everywhere
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${local.env}-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = local.everywhere
    nat_gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${local.env}-public"
  }
}

resource "aws_route_table_association" "private_az_one" {
  subnet_id      = aws_subnet.private_az_one.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private_az_two" {
  subnet_id      = aws_subnet.private_az_two.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_az_one" {
  subnet_id      = aws_subnet.public_az_one.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az_two" {
  subnet_id      = aws_subnet.public_az_two.id
  route_table_id = aws_route_table.public.id
}
