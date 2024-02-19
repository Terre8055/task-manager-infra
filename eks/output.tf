output "openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}

output "openid_connect_provider_sub" {
  value = aws_iam_openid_connect_provider.eks.url
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