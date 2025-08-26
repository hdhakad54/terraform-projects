Project 1: Deploy a High Availability (HA) Web Application
on AWS
This project demonstrates how to deploy a highly available web application on
AWS using Terraform. The infrastructure includes a Virtual Private Cloud (VPC),
subnets, an internet gateway, a route table, EC2 instances, an application load
balancer (ALB), and an auto-scaling group. The goal is to ensure fault tolerance
and scalability for the web application.

Implementation Steps

Step 1: Install and Configure Terraform
1. Install Terraform: Download Terraform from the official website and
install it on your local machine.
2. Set up AWS CLI: Configure the AWS CLI with your credentials using the
following command:
aws configure
Provide your AWS Access Key, Secret Key, default region (e.g., us-east-1), and
default output format.
3. Create a Working Directory: Create a folder for your project, e.g.,
terraform-ha-web-app.
Step 2: Initialize Terraform Project
1. Inside the project folder, create a file named 'main.tf' and add the AWS
provider configuration:
provider "aws" {
 region = "us-east-1"
}
2. Run the following command to initialize Terraform and download the
AWS provider plugin:
terraform init
Step 3: Create a VPC
A Virtual Private Cloud (VPC) isolates your resources and provides networking
infrastructure.
1. Define a VPC in a new file called vpc.tf:
resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 tags = {
 Name = "terraform-vpc"
 }
}
2. This configuration creates a VPC with the CIDR block 10.0.0.0/16.
Step 4: Create Public and Private Subnets
Subnets divide your VPC into smaller networks. Public subnets allow access to
the internet, while private subnets do not.
1. Add the subnet configurations to vpc.tf:
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
 cidr_block = "10.0.2
 availability_zone = "us-east-1b"
 tags = {
 Name = "private-subnet"
 }
}
2. The public subnet is configured to assign public IPs to instances
automatically.
Step 5: Add an Internet Gateway and Route Table
An internet gateway allows internet traffic to flow to resources in the public
subnet.
1. In vpc.tf, add the following resources:
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
2. This configuration sets up internet access for resources in the public
subnet.
Step 6: Launch EC2 Instances
Create web server instances to host your application.
1. Create a new file ec2.tf and define an EC2 instance:
resource "aws_instance" "web" {
 ami = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
 instance_type = "t2.micro"
 subnet_id = aws_subnet.public.id
 key_name = "your-key-pair"

 tags = {
 Name = "web-server"
 }
}
2. Ensure you have an existing key pair in your AWS account for SSH access.
Step 7: Set Up an Application Load Balancer
An ALB distributes incoming traffic across multiple instances for high
availability.
1. Create a new file alb.tf and define the ALB:
resource "aws_lb" "app" {
 name = "terraform-alb"
 internal = false
 load_balancer_type = "application"
 security_groups = [aws_security_group.alb_sg.id]
 subnets = [aws_subnet.public.id]
 tags = {
 Name = "terraform-alb"
 }
}
resource "aws_lb_target_group" "web_tg" {
 name = "web-target-group"
 port = 80
 protocol = "HTTP"
 vpc_id = aws_vpc.main.id
}
resource "aws_lb_listener" "web_listener" {
 load_balancer_arn = aws_lb.app.arn
 port = 80
 protocol = "HTTP"
 default_action {
 type = "forward"
 target_group_arn = aws_lb_target_group.web_tg.arn
 }
}
Step 8: Configure Auto-Scaling
Set up an auto-scaling group to ensure the application scales based on
demand.
1. In autoscaling.tf, add the following:
resource "aws_launch_configuration" "web" {
 name = "web-lc"
 image_id = "ami-0c55b159cbfafe1f0"
 instance_type = "t2.micro"
 key_name = "your-key-pair"

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
2. This configuration ensures the application can handle varying traffic
loads.
Step 9: Apply the Terraform Configuration
1. Initialize Terraform again:
terraform init
2. Validate the configuration to ensure there are no syntax errors:
terraform validate
3. Preview the infrastructure changes:
terraform plan
4. Deploy the infrastructure:
terraform apply
5. Confirm the deployment when prompted.
Outcome
• Infrastructure Components:
o A VPC with public and private subnets.
o An internet gateway for public subnet access.
o EC2 instances running in an auto-scaling group.
o An application load balancer routing traffic to the instances.
• Access:
o The web application is accessible via the ALB's DNS name.
o Traffic is distributed across instances to ensure high availability