
resource "helm_release" "argocd" {
  name             = "my-argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.53.14"
  namespace        = "argocd"
  create_namespace = true
  # depends_on = [ helm_release.nginx_ingress ]

  values = [
    "${file("argo-values.yaml")}"
  ]

}

















