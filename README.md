# S3 Static Website Hosting with Terraform

This repository contains Terraform configurations for setting up an AWS S3 bucket for static website hosting. The configuration includes setting up the bucket, uploading `index.html` and `error.html` files, and configuring the bucket policy for public read access.

## Files Overview

### `variables.tf`

Defines input variables used in the configuration:
- `bucket_name`: The name of the S3 bucket.
- `aws_region`: The AWS region to create resources in.

### `provider.tf`

Specifies the required Terraform provider and version:
- **AWS Provider**: `hashicorp/aws` version `~> 5.0`
- **AWS Region**: Configured using the `aws_region` variable.

### `output.tf`

Defines output values:
- `bucket_website_endpoint`: The endpoint of the S3 bucket website.
- `error_page_url`: The URL for the error page.

### `main.tf`

Contains resources and configurations:
- **S3 Bucket**: Creates an S3 bucket for static website hosting.
- **S3 Bucket Website Configuration**: Configures the S3 bucket for website hosting with `index.html` and `error.html`.
- **S3 Bucket Public Access Block**: Sets public access settings for the S3 bucket.
- **S3 Object**: Uploads `index.html` and `error.html` to the S3 bucket.
- **S3 Bucket Policy**: Applies a public read access policy to the S3 bucket.

### `.gitignore`

Specifies files and directories to ignore in version control:
- Local `.terraform` directories
- `.tfstate` files
- Crash log files
- `.tfvars` files
- Override files
- CLI configuration files