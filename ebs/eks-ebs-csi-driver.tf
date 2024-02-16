resource "aws_eks_addon" "eks_cluster_ebs_csi_addon" {
  cluster_name             = local.eks_cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.25.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks_cluster_ebs_csi_role.arn
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_ebs_csi_role_policy_attach,
    aws_iam_role.eks_cluster_ebs_csi_role
  ]
  tags = {
    tag-key = "${local.name}-ebs-csi-addon"
  }
}
############################################################################################################
# EKS Add-On - EBS CSI Driver
############################################################################################################
output "eks_cluster_ebs_addon_arn" {
  description = "Amazon Resource Name (ARN) of the EKS add-on"
  value       = aws_eks_addon.eks_cluster_ebs_csi_addon.arn
}
output "eks_cluster_ebs_addon_id" {
  description = "EKS Cluster name and EKS Addon name"
  value       = aws_eks_addon.eks_cluster_ebs_csi_addon.id
}
output "eks_cluster_ebs_addon_time" {
  description = "Date and time in RFC3339 format that the EKS add-on was created"
  value       = aws_eks_addon.eks_cluster_ebs_csi_addon.created_at
}