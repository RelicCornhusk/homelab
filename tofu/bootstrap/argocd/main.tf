resource "helm_release" "argocd" {
    name = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    version = "7.8.15"
    namespace = "argocd"
    create_namespace = true
}

data "kubernetes_service" "argocd_server" {
    metadata {
        name = "argocd-server"
        namespace = helm_release.argocd.namespace
    }
}
