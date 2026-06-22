variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "ec2_count" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "aws_key_name" {
  type = string
}