# Variable for the S3 bucket name
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# Variable for the AWS region
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}
