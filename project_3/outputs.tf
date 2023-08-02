# Define outputs
output "eks_cluster_name" {
  value       = aws_eks_cluster.cluster.name
  description = "The name of the EKS cluster"
}

output "mongodb_cluster_endpoint" {
  value       = aws_documentdb_cluster.mongodb_cluster.endpoint
  description = "The endpoint of the MongoDB cluster"
}
