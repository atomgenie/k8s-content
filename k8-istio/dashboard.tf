resource "helm_release" "dashboard" {
  name  = "dashboard-release"
  chart = "./03-dashboard"

  depends_on = [helm_release.certificates_base]
}
