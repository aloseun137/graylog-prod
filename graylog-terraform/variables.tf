variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24"]
}

variable "instance_type" {
  default = "t3.large"
}

variable "key_name" {
  description = "Name of EC2 key pair"
  default     = "graylog-key"
}
