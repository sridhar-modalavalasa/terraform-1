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
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}


// backend

terraform {
  backend "s3" {
    bucket           = "myfirstbucket987645"
    key              = "dyanamo.tfstate"
    region           = "us-west-2"
    dynamodb_table   = "fortf"
  }
}

