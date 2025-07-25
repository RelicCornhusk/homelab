image = {
  version   = "v1.7.5"
  schematic = file("schematic.yaml")
}

nodes = {
  "ctrl-00" = {
    host_node    = "abel"
    machine_type = "controlplane"
  }
  "ctrl-01" = {
    host_node    = "euclid"
    machine_type = "controlplane"
  }
  "ctrl-02" = {
    host_node    = "cantor"
    machine_type = "controlplane"
  }
}
