resource "aws_instance" "web" {
 ami = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.public.id
 security_groups = [aws_security_group.web_sg.name]
 key_name = "abc"
  tags = {
 Name = "web-instance"
 }
}
resource "aws_instance" "app" {
 ami = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.app.id
 security_groups = [aws_security_group.app_sg.name]
 key_name = "abc"
 tags = {
 Name = "app-instance"
 }
}
resource "aws_instance" "db" {
 ami = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.db.id
 security_groups = [aws_security_group.db_sg.name]
 key_name = "abc"
 tags = {
 Name = "db-instance"
 }
}
resource "aws_instance" "bastion" {
 ami = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 subnet_id = aws_subnet.public.id
 key_name = "abc"
 tags = {
 Name = "bastion-host"
 }
}