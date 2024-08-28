output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.compute.cluster_endpoint
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.compute.cluster_name
}

output "argocd_url" {
  description = "URL of the ArgoCD server"
  value       = module.argocd.argocd_url
}