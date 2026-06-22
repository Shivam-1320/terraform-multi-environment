variable "vpc_cidr" {
  type        = string
  description = "The Ip Range for The Vpc"
}

variable "environment" {
  type        = string
  description = "The name of the environment (dev , stage , prod)"
}

variable "public_subnet_cidr" {
  type        = string
  description = "The ip range for the public subnet"
}
