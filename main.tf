# Create S3 bucket for static website
resource "aws_s3_bucket" "static_website" {
  bucket        = var.bucket_name
  force_destroy = true # Allows deletion with objects
}

# Configure S3 bucket for website hosting
resource "aws_s3_bucket_website_configuration" "blog" {
  bucket = aws_s3_bucket.static_website.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

# Set public access settings for S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# Upload index.html to S3 bucket
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "index.html"
  source       = "html/index.html"
  content_type = "text/html"
}

# Upload error.html to S3 bucket
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.static_website.id
  key    = "error.html"
  source = "html/error.html"
}

# Apply public read access policy to S3 bucket
resource "aws_s3_bucket_policy" "read_access_policy" {
  depends_on = [
    aws_s3_bucket.static_website,
    aws_s3_bucket_website_configuration.blog
  ]
  bucket = aws_s3_bucket.static_website.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Action": [ 
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Principal": "*",   
      "Resource": [
        "${aws_s3_bucket.static_website.arn}",   
        "${aws_s3_bucket.static_website.arn}/*"   
      ]
    }
  ]
}
POLICY
}
