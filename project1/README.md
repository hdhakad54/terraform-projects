
````markdown
# Project 1: Deploy a High Availability (HA) Web Application on AWS using Terraform

This project demonstrates how to deploy a **highly available and fault-tolerant web application** on AWS using **Terraform**.  
The infrastructure includes a Virtual Private Cloud (VPC), public and private subnets, internet gateway, route tables, EC2 instances, an Application Load Balancer (ALB), and an Auto Scaling Group (ASG).  
The goal is to ensure **fault tolerance, scalability, and high availability** for the web application.

---

## 🚀 Architecture Overview

The Terraform configuration provisions the following:

- **VPC** with CIDR `10.0.0.0/16`
- **Public and Private Subnets** across multiple Availability Zones
- **Internet Gateway** and Route Table for public subnet internet access
- **EC2 Instances** (Amazon Linux 2) to serve as web servers
- **Application Load Balancer (ALB)** to distribute incoming traffic
- **Auto Scaling Group (ASG)** to scale EC2 instances based on demand
- **Security Groups** to allow controlled traffic (HTTP/HTTPS/SSH)

---

## 🛠 Implementation Steps

### 1. Install and Configure Prerequisites
- Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html):
  ```bash
  aws configure
````

Provide your **AWS Access Key, Secret Key, region (`us-east-1`)**, and output format (`json`).

---

### 2. Project Setup

Create and enter a working directory:

```bash
mkdir terraform-ha-web-app && cd terraform-ha-web-app
```

Initialize Terraform:

```bash
terraform init
```

---

### 3. Infrastructure Resources

#### VPC

```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "terraform-vpc" }
}
```

#### Subnets

* Public Subnet → `10.0.1.0/24` (AZ: us-east-1a)
* Private Subnet → `10.0.2.0/24` (AZ: us-east-1b)

#### Internet Gateway & Route Table

Enables outbound internet access for resources in public subnet.

#### EC2 Instances

Amazon Linux 2 instances deployed in the public subnet.

#### ALB

Distributes incoming HTTP requests across web servers.

#### Auto Scaling Group

Automatically scales instances between **1–3** based on demand.

---

### 4. Apply Terraform Configuration

Run the following commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Confirm with `yes` when prompted.

---

## ✅ Outcome

* **Infrastructure Components**

  * VPC with public & private subnets
  * Internet Gateway & routing for internet access
  * EC2 instances inside an Auto Scaling Group
  * Application Load Balancer distributing traffic

* **Access**

  * Web application accessible via the ALB DNS name
  * Traffic distributed across multiple instances
  * High availability & fault tolerance ensured

---

## 📌 Notes

* Update `key_name` in `ec2.tf` and `autoscaling.tf` with your **existing AWS key pair name** (not `.pem` file).
* Ensure **at least two subnets in different AZs** for ALB and ASG.
* Security groups must allow inbound traffic (HTTP/HTTPS) and restrict SSH appropriately (from your IP or a bastion host).

---

## 🧹 Cleanup

To avoid incurring charges, destroy the infrastructure:

```bash
terraform destroy
```

---

## 📖 References

* [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/index.html)
* [AWS Auto Scaling](https://docs.aws.amazon.com/autoscaling/index.html)

```

---

⚡ This README is **production-ready** and explains your project clearly for recruiters, GitHub viewers, or portfolio.  

Do you want me to also **draw an architecture diagram (VPC + subnets + ALB + ASG)** in the README using Markdown + Mermaid so it looks more professional?
```
