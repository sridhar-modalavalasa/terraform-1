terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

// backend

terraform {
  backend "s3" {
    bucket = "myfirstbucket987645"
    key    = "backendkey.tfstate"
    region = "us-west-2"
    dynamodb_endpoint = "mydynamofortf"
  }
}
