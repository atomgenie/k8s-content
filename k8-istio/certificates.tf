resource "time_sleep" "wait_cert_manager" {
  depends_on = [helm_release.cert_manager]

  create_duration = "20s"
}

resource "helm_release" "cluster_issuer" {
  name  = "cluster-issuer-release"
  chart = "./01-cluster-issuer"

  depends_on = [kubernetes_manifest.cloudflare_secret, time_sleep.wait_cert_manager]
}

resource "helm_release" "certificates_base" {
  name  = "certificates-release"
  chart = "./02-certificate"

  depends_on = [helm_release.cluster_issuer]
}
