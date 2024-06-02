variable "region" {
  description = "The region for the VPC"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.64.0/19", "10.0.96.0/19"]
  validation {
    condition     = length(var.public_cidrs) == 2
    error_message = "You must provide exactly two public CIDR blocks"
  }
}

variable "private_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.0.0/19", "10.0.32.0/19"]
  validation {
    condition     = length(var.private_cidrs) == 2
    error_message = "You must provide exactly two private CIDR blocks"
  }
}

variable "env" {
  description = "The environment for the VPC"
  type        = string
  default     = "daniel-portfolio"
}

variable "azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
  validation {
    condition     = length(var.azs) == 2
    error_message = "You must provide exactly two availability zones"
  }
}

variable "eks_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "daniel-eks"
}

variable "eks_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.30"

  validation {
    condition     = can(regex("^[0-9]+\\.[0-9]+$", var.eks_version))
    error_message = "The EKS version must be in the format 'x.y'"
  }
}

variable "kube_prometheus_stack_version" {
  description = "The version of the kube-prometheus stack"
  type        = string
}
variable "loki_stack_version" {
  description = "The version of the kube-prometheus stack"
  type        = string
}
