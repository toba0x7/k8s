provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example_user" {
  name = "example_user"
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.example_user.name
}

resource "aws_iam_user_policy" "example_policy" {
  name        = "example_policy"
  user        = aws_iam_user.example_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "ec2:Describe*",
        Effect = "Allow",
        Resource = "*",
      },
      {
        Action = "ecs:Describe*",
        Effect = "Allow",
        Resource = "*",
      },
      {
        Action = "s3:GetObject",
        Effect = "Allow",
        Resource = "arn:aws:s3:::your-bucket-name/*",
      },
      # Add more policies as needed
    ],
  })
}

