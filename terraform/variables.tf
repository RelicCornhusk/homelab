# tofu/variables.tf
variable "proxmox" {
  type = object({
    name         = string
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
    api_token    = string
  })
  sensitive = true
}

variable "argocd_admin_password" {
  type      = string
  sensitive = true
}

variable "sealed_secrets_cert" {
  type      = string
  sensitive = true
}

variable "sealed_secrets_key" {
  type      = string
  sensitive = true
}