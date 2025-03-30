# tofu/main.tf
module "talos" {
  source = "./talos"

  providers = {
    proxmox = proxmox
  }

  image = {
    version = "v1.9.5"
    schematic = file("${path.module}/talos/image/schematic.yaml")
  }

  cilium = {
    install = file("${path.module}/talos/inline-manifests/cilium-install.yaml")
    values = file("${path.module}/../kubernetes/cilium/values.yaml")
  }

  cluster = {
    name            = "talos"
    endpoint        = "192.168.18.22"
    gateway         = "192.168.18.1"
    talos_version   = "v1.9.5"
    proxmox_cluster = "homelab"
  }

  nodes = {
    "controlplane" = {
      host_node     = "media-server"
      machine_type  = "controlplane"
      ip            = "192.168.18.22"
      mac_address   = "a8:b8:e0:04:fa:42"
      vm_id         = 800
      cpu           = 4
      ram_dedicated = 13722
      ram_floating  = 8196
    }
  }
}

module "sealed_secrets" {
  depends_on = [module.talos]
  source = "./bootstrap/sealed-secrets"

  providers = {
    kubernetes = kubernetes
  }

  cert = {
    cert = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.cert")
    key = file("${path.module}/bootstrap/sealed-secrets/certificate/sealed-secrets.key")
  }
}

module "proxmox_csi_plugin" {
  depends_on = [module.talos]
  source = "./bootstrap/proxmox-csi-plugin"

  providers = {
    proxmox    = proxmox
    kubernetes = kubernetes
  }

  proxmox = var.proxmox
}

module "argocd" {
  depends_on = [ module.talos ]
  source = "./bootstrap/argocd"
  providers = {
    helm = helm
  }
}
# Use the module below to pre-create VM Disks and their respective Persistent Volumes
# module "volumes" {
#   depends_on = [module.proxmox_csi_plugin]
#   source = "./bootstrap/volumes"

#   providers = {
#     restapi    = restapi
#     kubernetes = kubernetes
#   }

#   proxmox_api = var.proxmox

#   volumes = {
#     pv-test = {
#       node = "media-server"
#       size = "36G"
#     }
#   }
# }
