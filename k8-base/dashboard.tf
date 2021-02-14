resource "helm_release" "dashboard" {
  name  = "dashboard-release"
  chart = "./dashboard-01"

  depends_on = [helm_release.certificates_base]
}
