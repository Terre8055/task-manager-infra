data "http" "eks_cluster_ebs_csi_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/master/docs/example-iam-policy.json"
  request_headers = {
    Accept = "application/json"
  }
}



############################################################################################################
# To get the Policy response body returned as a string
############################################################################################################
output "eks_cluster_ebs_csi_iam_policy" {
  value = data.http.eks_cluster_ebs_csi_iam_policy.response_body
}