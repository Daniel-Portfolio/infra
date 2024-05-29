resource "aws_subnet" "private_az_one" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = local.zone_one

  tags = {
    Name                                          = "${local.env}-private-${local.zone_one}"
    "kubernetes.io/role/internal-elb"             = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private_az_two" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = local.zone_two

  tags = {
    Name                                          = "${local.env}-private-${local.zone_two}"
    "kubernetes.io/role/internal-elb"             = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }
}


resource "aws_subnet" "public_az_one" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = local.zone_one
  map_public_ip_on_launch = true

  tags = {
    Name                                          = "${local.env}-public-${local.zone_one}"
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_az_two" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = local.zone_two
  map_public_ip_on_launch = true


  tags = {
    Name                                          = "${local.env}-public-${local.zone_two}"
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }
}

