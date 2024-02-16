variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region to deploy to"
  default     = "eu-west-1"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "task-manager-mike-portfolio"
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default = {
    owner           = "michael.appiah.dankwah"
    expiration_date = "03-03-2024"
    bootcamp        = "ghana2"
  }
}