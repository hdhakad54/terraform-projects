resource "aws_launch_template" "web" {
 name = "web-lc"
 image_id = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 key_name = "abc"

 lifecycle {
 create_before_destroy = true
 }
}
resource "aws_autoscaling_group" "web" {
   launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
 min_size = 1
 max_size = 3
 desired_capacity = 2
  vpc_zone_identifier  = [aws_subnet.public_1.id, aws_subnet.public_2.id]
 tag {
 key = "Name"
 value = "web-instance"
 propagate_at_launch = true
 }
}
