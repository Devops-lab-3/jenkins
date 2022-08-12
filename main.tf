provider "aws" {
  region  = "us-west-1"
  profile = "terraform"
}

terraform {
  backend "s3" {
    bucket         = "cognizant-lab-3"
    key            = "jenkins/terraform.tfstate"
    region         = "us-west-1"
    profile = "terraform"
    encrypt = true
  }
}

# Data Block
data "aws_ami" "al2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}