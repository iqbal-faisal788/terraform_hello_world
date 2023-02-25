terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"  
  region  = "us-east-2"
}

resource "aws_instance" "example_hellow" {
    ami = "ami-0fb653ca2d3203ac1"
    instance_type = "t2.micro" 

    tags = {
        Name = "terraform-example"
    }
}