resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  create_namespace = true
  namespace        = "cert-manager"
  chart            = "cert-manager"
  version          = "1.2.0"

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [
    helm_release.traefik,
  ]
}
