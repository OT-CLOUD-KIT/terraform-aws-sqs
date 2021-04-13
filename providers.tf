terraform {
  required_providers {
    aws = {
      version = ">= 3.33.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}