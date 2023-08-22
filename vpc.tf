#provider
provider "aws" {
    region = "ap-south-1"  
}
#VPC CREATION
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true
tags = {
    Name = "demo_vpc"
  }
}
#IGW FOR DEMO
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "demo_igw"
  }
}
#SUBNETS
resource "aws_subnet" "subnets" {
    count       = length(var.subnets_cidr)
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = element(var.subnets_cidr, count.index)  
    availability_zone = element(var.availability_zones, coun.index)
    map_piblic_ip_on_launch = true
tags = {
    Name = "demo_subnet_${count.index + 1}"
  }
}
# Route table for demo_vpc
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public_rt"
  }
}

# Route table and subnets assocation
resource "aws_route_table_association" "rt_sub_association" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


