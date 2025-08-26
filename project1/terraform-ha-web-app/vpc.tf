resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 tags = {
 Name = "terraform-vpc"
 }
}
resource "aws_subnet" "public" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.1.0/24"
 map_public_ip_on_launch = true
 availability_zone = "us-east-1a"
 tags = {
 Name = "public-subnet"
 }
}
resource "aws_subnet" "private" {
 vpc_id = aws_vpc.main.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1b"
 tags = {
 Name = "private-subnet"
 }
}
resource "aws_internet_gateway" "main" {
 vpc_id = aws_vpc.main.id
 tags = {
 Name = "terraform-igw"
 }
}
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id
 route {
 cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.main.id
 }
}
resource "aws_route_table_association" "public" {
 subnet_id = aws_subnet.public.id
 route_table_id = aws_route_table.public.id
}
