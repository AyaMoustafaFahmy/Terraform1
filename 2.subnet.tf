resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_public_subnet_1a
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-public-a01"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_public_subnet_1c
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-public-c01"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_private_subnet_1a
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-a01"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_private_subnet_1c
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-c01"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_private3_subnet_1a
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-a02"
  }
}
resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cider_block_private4_subnet_1c
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-c02"
  }
}