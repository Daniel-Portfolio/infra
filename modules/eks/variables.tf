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

variable "env" {
  description = "The environment for the VPC"
  type        = string
  default     = "daniel-portfolio"
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "At least 2 private subnets must be provided"
  }
}
