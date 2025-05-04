resource "aws_vpc" "main" {
  cidr_block                    = "10.0.0.0/16"
  enable_dns_support            = true
  enable_dns_hostnames          = true
  tags = {
    Name = "travelmemory-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                        = aws_vpc.main.id
  cidr_block                    = "10.0.1.0/24"
  availability_zone             = "us-west-1a"
  map_public_ip_on_launch       = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}
