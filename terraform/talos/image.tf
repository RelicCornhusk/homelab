# tofu/talos/image.tf
data "talos_image_factory_extensions_versions" "this" {
  talos_version = var.image.version
  filters = {
    names = [
      "i915",
      "intel-ucode",
      "qemu-guest-agent"
    ]
  }
}

resource "talos_image_factory_schematic" "this" {
  schematic = yamlencode(
    {
      customization = {
        systemExtensions = {
          officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info.*.name
        }
      }
    }
  )
}

resource "proxmox_virtual_environment_download_file" "this" {
  for_each = toset(distinct([for k, v in var.nodes : "${v.host_node}_${var.image.version}"]))

  node_name    = split("_", each.key)[0]
  content_type = "iso"
  datastore_id = var.image.proxmox_datastore

  file_name = "talos-${split("_", each.key)[1]}-${var.image.platform}-${var.image.arch}.iso"
  url       = format("https://factory.talos.dev/image/%s/%s/metal-amd64.iso", talos_image_factory_schematic.this.id, data.talos_image_factory_extensions_versions.this.talos_version)
  overwrite_unmanaged = true
}
