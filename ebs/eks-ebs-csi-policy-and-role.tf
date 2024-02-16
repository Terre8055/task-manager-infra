### Create EBS CSI IAM Policy using the  ebs_csi_iam_policy output
resource "aws_iam_policy" "eks_cluster_ebs_csi_iam_policy" {
  name        = "${local.eks_cluster_name}-ebs-csi-policy"
  path        = "/"
  description = "EBS CSI IAM Policy"
  policy      = data.http.eks_cluster_ebs_csi_iam_policy.response_body
  tags = {
    tag-key = "${local.name}-ebs-csi-policy"
  }
}

############################################################################################################
# EKS Cluster EBS CSI policy arn
############################################################################################################

output "eks_cluster_ebs_csi_iam_policy_arn" {
  value = aws_iam_policy.eks_cluster_ebs_csi_iam_policy.arn
}



############################################################################################################
### Reference: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
### Create IAM Policy and associate role with the Policy
data "aws_iam_policy_document" "eks_cluster_ebs_csi_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = [var.oidc]
    }
    condition {
      test     = "StringEquals"
      variable = "${var.oidc}:sub"
      values   = ["system:serviceaccount:kube-system:aws-ebs-csi-controller-sa"]
    }
  }
  version = "2012-10-17"
}


### Associate role with the Policy eks_cluster_ebs_csi_policy
resource "aws_iam_role" "eks_cluster_ebs_csi_role" {
  name               = "${local.eks_cluster_name}-ebs-csi-role"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_ebs_csi_policy.json
  tags = {
    tag-key = "${local.name}-ebs-csi-role"
  }
}

# Associate EBS CSI IAM Policy to EBS CSI IAM Role
resource "aws_iam_role_policy_attachment" "eks_cluster_ebs_csi_role_policy_attach" {
  policy_arn = aws_iam_policy.eks_cluster_ebs_csi_iam_policy.arn
  role       = aws_iam_role.eks_cluster_ebs_csi_role.name
}


############################################################################################################
# Eks Cluster EBS CSI Role Arn
############################################################################################################

output "ebs_csi_iam_role_arn" {
  description = "EBS CSI IAM Role ARN"
  value       = aws_iam_role.eks_cluster_ebs_csi_role.arn
}
