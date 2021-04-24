build {
  sources = ["source.proxmox.ubuntu" ]

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}

build {
  sources = ["source.proxmox.debian" ]

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}