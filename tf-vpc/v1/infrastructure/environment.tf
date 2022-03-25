terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "iwasa-terraform-state-bucket"
    key    = "tf-vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# VPC
resource "aws_vpc" "tf-hoge-vpc" {
  cidr_block           = var.environment.inputs.vpc_cidr
  enable_dns_hostnames = true
}

# Subnet
resource "aws_subnet" "tf-hoge-subnet" {
  vpc_id     = aws_vpc.tf-hoge-vpc.id
  cidr_block = var.environment.inputs.subnet_cidr
}
