resource "aws_iam_user" "user" {
  name = "testuser"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_iam_user_policy" "user_policy" {
  name = "testpolicy"
  user = aws_iam_user.user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        # Resource = "${aws_s3_bucket.example.arn}"
        Resource = [var.resource]
        # Resource = "*"
      },
    ]
  })
}