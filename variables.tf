variable "aws_region" {
  description = "Default region of aws instance"
  type        = string
  default     = "us-east-1"
}

variable "aws_secret_key" {
  description = "Account secret key"
  type        = string
}

variable "aws_access_key" {
  description = "Account access key"
  type        = string
}

variable "aws_token" {
  description = "Account token"
  type        = string
}

variable "public_ssh_key_name" {
  description = "Name of SSH KEY"
  type        = string
}

variable "public_ssh_key_file" {
  description = "Public ssh key file"
  type        = string
}

variable "aws_sg_name" {
  description = "Name of security group"
  type        = string
}

variable "aws_sg_desc" {
  description = "Description of security group"
  type        = string
}

variable "aws_sg_cidr_blocks" {
  description = "Cidr blocks of security group"
  type        = list(string)
}

variable "aws_sg_ingress_port" {
  description = "Ingress port of security group"
  type        = number
  default     = 22
}

variable "aws_sg_ingress_protocol" {
  description = "Protocol of ingress in security group"
  type        = string
}

variable "aws_sg_ingress_desc" {
  description = "Description of ingress in security group"
  type        = string
}

variable "aws_ec2_ami" {
  description = "Ami of ec2 instance"
  type        = string
}

variable "aws_instance_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_instance_name" {
  description = "AWS instance name"
  type        = string
}
