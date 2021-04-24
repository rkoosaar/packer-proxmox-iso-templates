# Proxmox related
variable "proxmox_url" {
  type    = string
  default = "${env("PROXMOX_URL")}"
}

variable "proxmox_user" {
  type    = string
  default = "${env("PROXMOX_USER")}"
}

variable "proxmox_password" {
  type    = string
  default = "${env("PROXMOX_PASSWORD")}"
}

variable "proxmox_node" {
  type    = string
  default = "${env("PROXMOX_NODE_NAME")}"
}

# VM generic
variable "vm_cpu_sockets" {
  type    = number
  default = "1"
}

variable "vm_cpu_cores" {
  type    = number
  default = "2"
}

variable "vm_cpu_type" {
  type    = string
  default = "host"
}

variable "vm_mem_size" {
  type    = number
  default = "4096"
}

variable "vm_os_disk_size" {
  type    = string
  default = "20G"
}

variable "vm_network_adapters_model" {
  type    = string
  default = "virtio"
}

variable "vm_network_adapters_bridge" {
  type    = string
  default = "vmbr0"
}
