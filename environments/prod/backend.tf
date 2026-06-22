terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket       = "pankaj-global-terraform-state-bucket"
    key          = "environments/prod/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}