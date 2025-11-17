variable "region" {
  description = "AWS region"
  type        = string
}

variable "profile" {
  description = "AWS CLI profile to use"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

# ec2 variable
variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

# vpc variable
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}


variable "ssh_my_ip" {
  type        = string
  description = "IP allowed to SSH into the bastion"
}
