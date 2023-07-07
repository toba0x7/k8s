# Define the provider and version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.61.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Create the VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Create the subnets
resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "subnet-${count.index}"
  }
}

# Create a security group for the application
resource "aws_security_group" "app_sg" {
  name        = "socket-io-app-sg"
  description = "Security group for the Socket.IO app"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the MongoDB cluster
resource "aws_documentdb_cluster" "mongodb_cluster" {
  cluster_identifier    = var.mongodb_cluster_name
  master_username       = var.mongodb_username
  master_password       = var.mongodb_password
  skip_final_snapshot   = true
  backup_retention_days = 0
  deletion_protection   = false

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  snapshot_window {
    start = "01:00"
    end   = "02:00"
  }
}

# Create the EKS worker nodes
resource "aws_eks_node_group" "worker_nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "worker-nodes"
  node_role_arn   = aws_iam_instance_profile.worker_instance_profile.arn
  subnet_ids      = var.subnet_ids
  scaling_config {
    desired_size = var.worker_node_count
    min_size     = var.worker_node_min_count
    max_size     = var.worker_node_max_count
  }
}
