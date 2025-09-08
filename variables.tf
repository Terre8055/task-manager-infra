variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "little-book"
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default = {}
}
