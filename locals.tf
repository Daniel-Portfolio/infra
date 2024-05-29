locals {
  env      = "daniel-portfolio"
  region   = "ap-south-1"
  zone_one = "ap-south-1a"
  zone_two = "ap-south-1b"

  eks_name     = "daniel-eks"
  cluster_name = "${local.env}-${local.eks_name}"
  eks_version  = "1.30"

  everywhere = "0.0.0.0/0"

}
