########## route tables ############
######## private route table wiithout NAT #######
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-rt"
  }
}

#######private with nat gatway #########

#1#elastic ip resource
resource "aws_eip" "eip" {
  vpc      = true
    tags = {
      Name = "${var.name_tag}-${var.enviroment}-eip"
    }
}

#2#natgateway resource#
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-nat_gw"
  }
}
####to add another nat gw ######
# resource "aws_nat_gateway" "nat_gw_2" {
#   allocation_id = aws_eip.eip.id
#   subnet_id     = aws_subnet.public1.id

#   tags = {
#     Name = "${var.name_tag}-${var.enviroment}-nat_gw"
#   }
# }

#3#the table###
resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }


  tags = {
    Name = "${var.name_tag}-${var.enviroment}-private-rt"
  }
}


########## public route table ###############

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.name_tag}-${var.enviroment}-public-rt"
  }
}


######## subnet association ########

resource "aws_route_table_association" "public_subnet_terra_1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_terra_2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet_terra_1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_terra_2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_terra_3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private2.id
}

resource "aws_route_table_association" "private_subnet_terra_4" {
  subnet_id      = aws_subnet.private4.id
  route_table_id = aws_route_table.private2.id
}

