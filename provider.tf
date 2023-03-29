terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  alias  = "account1"
  region = "us-east-1"
  profile = "account1"
}

provider "aws" {
  alias  = "account2"
  region = "us-east-1"
  profile = "account2"
}
