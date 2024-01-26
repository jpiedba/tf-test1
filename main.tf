## PUT TERRAFORM CLOUD BLOCK HERE!  ##

terraform {

  cloud {
    organization = "jp-thebest"

    workspaces {
      name = "thebest-cli"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }

}


# Variable blocks directly within the main.tf. No arguments necessary.
#variable "aws_access_key" {}
#variable "aws_secret_key" {}
variable "region" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  region     = var.region
}

# Add .gitignore file in this directory with the terraform.tfvars

resource "aws_instance" "tc_instance" {
  ami           = "ami-0506d6d51f1916a96"
  instance_type = "t3.micro"

  tags = {
    Name = "TC-triggered-instance"
  }
}

resource "aws_iam_user" "test_user_99" {

  name = "test-user-99"

}

resource "aws_iam_user "test_user_jane" {
  name = "dodanie-usera-tymsamymplikiem"
}