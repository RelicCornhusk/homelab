# tofu/main.tf
module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  image = {
    version   = "v1.10.4"
    schematic = file("${path.module}/talos/image/schematic.yaml")
  }

  cilium = {
    install = file("${path.module}/talos/inline-manifests/cilium-install.yaml")
    values  = file("${path.module}/talos/inline-manifests/values.yaml")
  }

  cluster = {
    name            = "talos"
    endpoint        = "10.0.0.241"
    gateway         = "10.0.0.1"
    talos_version   = "v1.10.4"
    proxmox_cluster = "homelab"
  }

  nodes = {
    "controlplane" = {
      host_node     = "magi"
      machine_type  = "controlplane"
      ip            = "10.0.0.241"
      mac_address   = "BC:24:11:6E:40:D6"
      vm_id         = 800
      cpu           = 4
      ram_dedicated = 10240
      ram_floating  = 10240
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
    cert = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.cert")
    key  = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.key")
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

# commenting out since it's not in state and I can't import right now
# resource "helm_release" "argocd" {
#   depends_on       = [module.talos]
#   name             = "argocd"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   namespace        = "argocd"
#   version          = "8.0.14"
#   create_namespace = true
#   set = [{
#     name  = "configs.secret.argocdServerAdminPassword"
#     value = bcrypt(var.argocd_admin_password)
#     },
#     # required for exposing server with Gateway API
#     {
#       name = "configs.params.server\\.insecure"
#       value = "true"
#     }
#   ]
#   lifecycle {
#     ignore_changes = [
#       set[0].value, # ignore changes to the password (needed for sensitive variable handling)
#     ]
#   }
# }



# Create this resource on a second apply 
# See https://discuss.hashicorp.com/t/depends-on-feature-is-not-working-properly-to-run-the-k8s-manifests-after-eks-cluster-creation/61716/2

resource "kubernetes_manifest" "app_of_apps" {
  # depends_on = [helm_release.argocd]
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "finalizers" = [
        "resources-finalizer.argocd.argoproj.io",
      ]
      "name"      = "apps"
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
      "syncPolicy" = {
        automated = {
          prune: true
        }
      }
    }
  }
}

