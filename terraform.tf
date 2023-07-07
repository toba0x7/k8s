# Configure the Terraform backend
terraform {
  backend "s3" {
    bucket = "your-s3-bucket"
    key    = "your-terraform-state-key"
    region = "your-s3-bucket-region"
  }
}
