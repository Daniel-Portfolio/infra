locals {
  env      = "prod"
  region   = "ap-south-1"
  zone_one = "ap-south-1a"
  zone_two = "ap-south-1b"

  eks_name    = "daniel-eks"
  eks_version = "1.30"

  everywhere = "0.0.0.0/0"
}
