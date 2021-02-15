resource "null_resource" "kiali" {

  provisioner "local-exec" {
    command = "kubectl apply -f ./04-kiali || true"
  }

}
