resource "aws_launch_configuration" "web" {
 name = "web-lc"
 image_id = "ami-00ca32bbc84273381"
 instance_type = "t2.micro"
 key_name = "abc"

 lifecycle {
 create_before_destroy = true
 }
}
resource "aws_autoscaling_group" "web" {
 launch_configuration = aws_launch_configuration.web.id
 min_size = 1
 max_size = 3
 desired_capacity = 2
 vpc_zone_identifier = [aws_subnet.public.id]
 tag {
 key = "Name"
 value = "web-instance"
 propagate_at_launch = true
 }
}
