# Configure AWS provider
provider "aws" {
  region = var.aws_region # Set the desired AWS region
  access_key=var.aws_access_key
  secret_key=var.aws_secret_key
}

terraform {
  backend "s3" {
    bucket         = "S3_BUCKET_NAME"  # Replace with your S3 bucket name
    key            = "terraform/state.tfstate"
    region         = "us-east-1"  # Replace with your desired region
    dynamodb_table = "DYNAMO_DB_TABLE_NAME"  # Replace with your DynamoDB table name
    encrypt        = true
  }
}
# Create an AWS EKS cluster
resource "aws_iam_role" "eks-iam-role" {
 name = "test-eks-iam-role"

 path = "/"

 assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 role    = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
 role    = aws_iam_role.eks-iam-role.name
}