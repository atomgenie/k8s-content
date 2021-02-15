resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  version    = "9.14.2"

  set {
    name  = "additionalArguments"
    value = "{${join(",", ["--providers.kubernetesIngress.ingressClass=traefik-cert-manager", "--entrypoints.websecure.http.tls", "--api.dashboard=true"])}}"
  }

  set {
    name  = "ingressRoute.dashboard.enabled"
    value = false
  }
}
