# Terraform Projects: Mastering Cloud Infrastructure Automation

This repository contains **5 hands-on Terraform projects** designed to help you master cloud infrastructure automation on AWS. Each project focuses on a real-world scenario, guiding you through the essential steps to build, secure, and automate cloud resources using Terraform.

---

## Table of Contents

- [Project 1: Deploy a High Availability (HA) Web Application on AWS](#project-1-deploy-a-high-availability-ha-web-application-on-aws)
- [Project 2: Deploy a Secure Multi-Tier Web Application on AWS](#project-2-deploy-a-secure-multi-tier-web-application-on-aws)
- [Project 3: Automate Kubernetes Cluster Deployment on AWS Using Terraform](#project-3-automate-kubernetes-cluster-deployment-on-aws-using-terraform)
- [Project 4: Automate the Deployment of a Complete CI/CD Pipeline on AWS](#project-4-automate-the-deployment-of-a-complete-cicd-pipeline-on-aws)
- [Project 5: Automate the Deployment of a Serverless Application Using AWS Lambda](#project-5-automate-the-deployment-of-a-serverless-application-using-aws-lambda)

---

## Project 1: Deploy a High Availability (HA) Web Application on AWS

**Implementation Steps:**
- Set Up Terraform
- Create a VPC
- Create two Public Subnets
- Set Up Internet Gateway and Route Table
- Launch EC2 Instances
- Configure Application Load Balancer
- Set Up Auto-Scaling Group
- Apply Terraform Configuration

---

## Project 2: Deploy a Secure Multi-Tier Web Application on AWS

**Implementation Steps:**
- Set Up Terraform
- Create a VPC
- Create Public, Application, and Database Subnets
- Add Internet Gateway and Route Tables
- Configure Security Groups for Tiers
- Launch EC2 Instances for Web, Application, and Database Tiers
- Set Up a Bastion Host for Secure Access
- Apply Terraform Configuration

---

## Project 3: Automate Kubernetes Cluster Deployment on AWS Using Terraform

**Implementation Steps:**
- Set Up Terraform
- Create a VPC
- Create Public and Private Subnets
- Deploy an EKS Cluster Using Terraform Modules
- Set Up IAM Roles and Policies for EKS
- Configure `kubectl` to Connect to the EKS Cluster
- Deploy a Sample Application on Kubernetes
- Apply Terraform Configuration

---

## Project 4: Automate the Deployment of a Complete CI/CD Pipeline on AWS

**Implementation Steps:**
- Set Up Terraform
- Create an S3 Bucket for Hosting
- Create a CodeCommit Repository for Source Code
- Set Up a CodeBuild Project for Build Automation
- Configure IAM Roles for CodeBuild and CodePipeline
- Create a Fully Automated CodePipeline
- Apply Terraform Configuration
- Test the CI/CD Pipeline

---

## Project 5: Automate the Deployment of a Serverless Application Using AWS Lambda

**Implementation Steps:**
- Set Up Terraform
- Create an S3 Bucket for Lambda Deployment Package
- Create a DynamoDB Table for Data Storage
- Define and Deploy the Lambda Function
- Set Up IAM Roles and Policies for Lambda
- Configure API Gateway to Expose Lambda as a REST API
- Apply Terraform Configuration
- Test the Serverless Application

---

## Getting Started

1. Clone this repository.
2. Navigate to the project directory you want to try.
3. Follow the implementation steps in each project folder.
4. Make sure you have [Terraform](https://www.terraform.io/downloads.html) and [AWS CLI](https://aws.amazon.com/cli/) installed and configured.
