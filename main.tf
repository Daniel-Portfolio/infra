module "network" {
  source        = "./modules/network"
  vpc_cidr      = var.vpc_cidr
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  env           = var.env
  azs           = var.azs
  eks_name      = var.eks_name
}

module "eks" {
  source             = "./modules/eks"
  eks_name           = var.eks_name
  eks_version        = var.eks_version
  env                = var.env
  private_subnet_ids = module.network.private_az_ids
}
