variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  description = "CIDR block range for the private subnet"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24"]
  description = "CIDR block range for the public subnet"
}

variable "private_subnet_tag_name" {
  type        = string
  default     = "Custom Kubernetes cluster private subnet"
  description = "Name tag for the private subnet"
}

variable "public_subnet_tag_name" {
  type        = string
  default     = "Custom Kubernetes cluster public subnet"
  description = "Name tag for the public subnet"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "List of availability zones for the selected region"
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
}