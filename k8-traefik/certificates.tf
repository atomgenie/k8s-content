resource "time_sleep" "wait_cert_manager" {
  depends_on = [helm_release.cert_manager]

  create_duration = "10s"
}

resource "helm_release" "cluster_issuer" {
  name  = "cluster-issuer-release"
  chart = "./traefik-01"

  depends_on = [kubernetes_manifest.cloudflare_secret, time_sleep.wait_cert_manager]
}

resource "helm_release" "certificates_base" {
  name  = "certificates-release"
  chart = "./traefik-02"

  depends_on = [helm_release.cluster_issuer]
}

resource "helm_release" "traefik_dashboard" {
  name  = "traefik-dashboard-release"
  chart = "./traefik-03"

  depends_on = [helm_release.certificates_base]
}
