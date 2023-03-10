terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 2.70"
        }
    }
}

    # Configure provider
provider "aws" {
    region  = "us-east-1"
}