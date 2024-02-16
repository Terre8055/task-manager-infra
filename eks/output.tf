output "openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.default.arn
}

output "endpoint"{
  value = aws_eks_cluster.main.endpoint
}

output "certificate_authority" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}
output "name"{
  value = aws_eks_cluster.main.name
}