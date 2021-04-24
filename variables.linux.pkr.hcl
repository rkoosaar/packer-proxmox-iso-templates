# Ubuntu Specific
variable "vm_name_ubuntu" {
  type    = string
  default = "pkr-template-ubuntu"
}

# Ubuntu Specific
variable "vm_name_debian" {
  type    = string
  default = "pkr-template-debian"
}

variable "linuxadmin_password" {
  type    = string
  default = "${env("LINUXADMIN_PASSWORD")}"
}
