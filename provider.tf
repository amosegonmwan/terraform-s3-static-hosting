# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # AWS provider source
      version = "~> 5.0"        # Provider version constraint
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region # AWS region to use
}
