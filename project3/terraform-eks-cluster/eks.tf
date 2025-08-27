module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "21.1.5" # or your preferred version

   name    = "eks-cluster"
 # cluster_version = "1.29"
  vpc_id          = aws_vpc.eks_vpc.id
  subnet_ids      = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]

  eks_managed_node_groups = {
    eks_nodes = {
      desired_size = 2
      max_size     = 3
      min_size     = 1
      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Name = "eks-cluster"
  }
}