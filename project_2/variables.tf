# Define variables
variable "aws_region" {
  type    = string
  default = "us-west-2"  # Replace with your desired AWS region
}

variable "cluster_name" {
  type    = string
  default = "socket-io-cluster"  # Replace with your desired cluster name
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-12345678", "subnet-87654321"]  # Replace with your desired subnet IDs
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
}

variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]  # Replace with your desired subnet CIDR blocks
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]  # Replace with your desired availability zones
}

variable "worker_node_count" {
  type    = number
  default = 2  # Replace with your desired worker node count
}

variable "worker_node_min_count" {
  type    = number
  default = 1  # Replace with your desired worker node minimum count
}

variable "worker_node_max_count" {
  type    = number
  default = 3  # Replace with your desired worker node maximum count
}

variable "mongodb_cluster_name" {
  type    = string
  default = "socket-io-mongodb-cluster"  # Replace with your desired MongoDB cluster name
}

variable "mongodb_username" {
  type    = string
  default = "mongodb_user"  # Replace with your desired MongoDB username
}

variable "mongodb_password" {
  type    = string
  default = "mongodb_password"  # Replace with your desired MongoDB password
}
