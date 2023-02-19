terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "kaan-jenkins-project"
    key = "backend/tf-backend-jenkins.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}