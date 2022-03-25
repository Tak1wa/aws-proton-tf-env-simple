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
