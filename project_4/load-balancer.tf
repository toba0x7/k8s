resource "aws_lb" "example_lb" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-12345678", "subnet-23456789"] # Replace with your subnet IDs
  enable_deletion_protection = false
}

# Define listeners, target groups, and other load balancer settings as needed.

