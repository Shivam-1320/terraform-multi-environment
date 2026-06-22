variable "environment" {
  type        = string
  description = "The name of the environment "
}

variable "instance_type" {
  type        = string
  description = "The size of the ec2 instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id where the ec2 instance will be deploy"
}

variable "key_name" {
  type        = string
  description = "The name of the existing AWS SSH key pair"
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to provision"
  default     = 1
}

variable "security_group_id" {
  type        = string
  description = "The security group ID to attach to the instance"
}