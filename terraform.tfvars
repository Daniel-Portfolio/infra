env           = "daniel-portfolio"
region        = "ap-south-1"
vpc_cidr      = "10.0.0.0/16"
public_cidrs  = ["10.0.64.0/19", "10.0.96.0/19"]
private_cidrs = ["10.0.0.0/19", "10.0.32.0/19"]
azs           = ["ap-south-1a", "ap-south-1b"]
eks_name      = "daniel-eks"
eks_version   = "1.30"

