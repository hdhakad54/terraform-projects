resource "aws_instance" "web" {
 ami = "ami-00ca32bbc84273381" # Amazon Linux 2 AMI
 instance_type = "t2.micro"
 subnet_id = aws_subnet.public.id
 key_name = "abc.pem"

 tags = {
 Name = "web-server"
 }
}
