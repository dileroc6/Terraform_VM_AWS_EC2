resource "aws_vpc" "vpc_california" {
  cidr_block = var.california_cidr
  tags = {
    Name = "vpc_california"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_california.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_california.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private_subnet"
  }
  depends_on = [
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_california.id

  tags = {
    Name = "igw vpc california"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_california.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public crt"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public instance SG"
  description = "Allow SSH inbound and ALL egress traffic"
  vpc_id      = aws_vpc.vpc_california.id

  ingress {
    description = "SSH over Internet"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    description = "SSH over Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Public Instance SG"
  }
}