terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
  
  default_tags {
    tags = {
      Environment = "Assessment"
      Project     = "Cloud-Engineer-Internship"
      Owner       = "Shubh_Shukla"
    }
  }
}
