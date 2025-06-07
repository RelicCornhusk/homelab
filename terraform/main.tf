# tofu/main.tf
module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  image = {
    version   = "v1.10.3"
    schematic = file("${path.module}/talos/image/schematic.yaml")
  }

  cilium = {
    install = file("${path.module}/talos/inline-manifests/cilium-install.yaml")
    values  = file("${path.module}/talos/inline-manifests/values.yaml")
  }

  cluster = {
    name            = "talos"
    endpoint        = "192.168.18.23"
    gateway         = "192.168.18.1"
    talos_version   = "v1.10.3"
    proxmox_cluster = "homelab"
  }

  nodes = {
    "controlplane" = {
      host_node     = "magi"
      machine_type  = "controlplane"
      ip            = "192.168.18.23"
      mac_address   = "a8:b8:e0:04:fa:42"
      vm_id         = 800
      cpu           = 4
      ram_dedicated = 13722
      ram_floating  = 8196
      igpu          = true
    }
  }
}

module "sealed_secrets" {
  depends_on = [module.talos]
  source     = "./bootstrap/sealed-secrets"

  providers = {
    kubernetes = kubernetes
  }

  cert = {
    cert = var.sealed_secrets_cert
    key  = var.sealed_secrets_key
  }
}

module "proxmox_csi_plugin" {
  depends_on = [module.talos]
  source     = "./bootstrap/proxmox-csi-plugin"

  providers = {
    proxmox    = proxmox
    kubernetes = kubernetes
  }

  proxmox = var.proxmox
}

resource "helm_release" "argocd" {
  depends_on       = [module.talos]
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.0.14"
  create_namespace = true
  set = [{
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd.admin_password
    }, {
    name  = "configs.secret.argocdServerAdminPasswordMtime"
    value = timestamp()
  }]
}


resource "kubernetes_manifest" "app_of_apps" {
  depends_on = [helm_release.argocd]
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "finalizers" = [
        "resources-finalizer.argocd.argoproj.io",
      ]
      "name"      = "applications"
      "namespace" = "argocd"
    }
    "spec" = {
      "destination" = {
        "namespace" = "default"
        "server"    = "https://kubernetes.default.svc"
      }
      "project" = "default"
      "source" = {
        "path"           = "argocd/apps"
        "repoURL"        = "https://github.com/RelicCornhusk/homelab.git"
        "targetRevision" = "HEAD"
      }
    }
  }
}