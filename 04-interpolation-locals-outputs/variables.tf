variable "environment" {
  type        = string
  description = "The environment for the resources, e.g., dev, staging, prod."
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in."
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key for authentication."
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key for authentication."
}

variable "aws_profile" {
  type        = string
  description = "AWS profile to use for authentication."
}

variable "instance_ami" {
  type        = string
  description = "AMI ID for the EC2 instance."
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance."
}

variable "instance_tags" {
  type        = map(string)
  description = "Tags to apply to the EC2 instance."
  default = {
    Name    = "Ubuntu"
    Project = "Terraform Basics"
  }
}

