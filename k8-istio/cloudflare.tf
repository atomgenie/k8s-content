resource "kubernetes_manifest" "cloudflare_secret" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "v1"
    kind       = "Secret"
    metadata = {
      name      = "cloudflare-apikey-secret"
      namespace = "cert-manager"
    }

    type = "Opaque"
    stringData = {
      apikey = var.CLOUDFLARE_API_KEY
    }
  }
}
