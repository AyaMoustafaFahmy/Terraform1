# aws_vpc is resource 
#main is identifier 
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cider_block
  #   ="10.0.0.0/16"
  #   ="${var.vpc_cider_block}"
  
  tags = {
    Name = "${var.name_tag}-${var.enviroment}-vpc"
  }
}