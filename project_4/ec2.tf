resource "aws_instance" "example_instance" {
  ami           = "ami-12345678" # Replace with your desired AMI
  instance_type = "t2.micro"
  key_name      = "your-key-pair"
  # Add other EC2 instance settings as needed
}

# Define security groups, VPC, and other networking resources as necessary.

