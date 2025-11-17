variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR for the private subnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
