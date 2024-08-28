variable "enable_addons" {
  description = "Enable EKS addons (kube-proxy, coredns, vpc-cni)"
  type        = bool
  default     = true
}

resource "aws_eks_addon" "kube_proxy" {
  count         = var.enable_addons ? 1 : 0
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "kube-proxy"
  depends_on    = [aws_eks_node_group.eks_nodes]
}

resource "aws_eks_addon" "coredns" {
  count         = var.enable_addons ? 1 : 0
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "coredns"
  depends_on    = [aws_eks_node_group.eks_nodes]
}

resource "aws_eks_addon" "vpc_cni" {
  count         = var.enable_addons ? 1 : 0
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "vpc-cni"
  depends_on    = [aws_eks_node_group.eks_nodes]
}