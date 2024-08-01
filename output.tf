# Output the base URL of the S3 bucket website
output "bucket_website_endpoint" {
  value       = "http://${aws_s3_bucket_website_configuration.blog.website_endpoint}"
  description = "The endpoint of the S3 bucket website"
}

# Output the URL for the error page
output "error_page_url" {
  value       = "http://${aws_s3_bucket_website_configuration.blog.website_endpoint}/error.html"
  description = "The URL for the error page"
}
