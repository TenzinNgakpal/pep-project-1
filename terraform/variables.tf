variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances (e.g., Ubuntu Server)."
  type        = string
  default     = "ami-02424013dc0fcb618"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "The name of the EC2 Key Pair for SSH access."
  type        = string
  default     = "eldennihil"
}
