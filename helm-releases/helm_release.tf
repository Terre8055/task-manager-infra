
resource "helm_release" "argocd" {
  name             = "my-argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.53.14"
  namespace        = "argocd"
  create_namespace = true
  depends_on = [ helm_release.nginx_ingress ]

  values = [
    "${file("./argo-values.yaml")}"
  ]

}

resource "helm_release" "nginx_ingress" {
  name          = "my-ingress-nginx"
  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  force_update  = true
  namespace     = "nginx-ingress"
  recreate_pods = true
  reuse_values  = true
  create_namespace = true


  values = [
    "${file("./ingress-values.yaml")}"
  ]
}


resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  create_namespace = true
  wait             = true

  set {
    name  = "installCRDs"
    value = "true"
  }

}
















