source "proxmox" "debian" {
    # Connection Configuration
    proxmox_url             = "${var.proxmox_url}"
    username                = "${var.proxmox_user}"
    password                = "${var.proxmox_password}"
    insecure_skip_tls_verify    = "true"
    node                    = "${var.proxmox_node}"

    # Location Configuration
    vm_name                 = "${var.vm_name_debian}"
    vm_id                   = "9001"

    # Hardware Configuration
    sockets                 = "${var.vm_cpu_sockets}"
    cores                   = "${var.vm_cpu_cores}"
    memory                  = "${var.vm_mem_size}"
    cpu_type                = "${var.vm_cpu_type}"

    # Boot Configuration
    boot_command          = ["<esc><wait>", "install <wait>", " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>", "debian-installer=en_GB.UTF-8 <wait>", "auto <wait>", 
    "locale=en_GB.UTF-8 <wait>", "kbd-chooser/method=gb <wait>", "keyboard-configuration/xkb-keymap=gb <wait>", "netcfg/get_hostname=pkr-template-debian <wait>", "netcfg/get_domain=local.domain <wait>",
    "fb=false <wait>", "debconf/frontend=noninteractive <wait>", 
    "console-setup/ask_detect=false <wait>", "console-keymaps-at/keymap=gb <wait>", "grub-installer/bootdev=/dev/sda <wait>", "<enter><wait>"]
    boot_wait              = "5s"
    
    # Http directory Configuration
    http_directory         = "debian/http"

    # ISO Configuration
    iso_checksum            = "file:https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/SHA256SUMS"
    iso_file                = "iso-store:iso/debian-10.9.0-amd64-netinst.iso"
    #iso_url                 = "https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso"
    #iso_storage_pool        = "iso-store"

    # VM Configuration
    os                      = "l26"
    vga {
        type                =  "std"
        memory              =  32
    }

    network_adapters {
        model               = "${var.vm_network_adapters_model}"
        bridge              = "${var.vm_network_adapters_bridge}"
        vlan_tag            = "20"
        firewall            = true
    }

    disks {
        storage_pool      = "local-lvm"
        storage_pool_type = "lvm-thin"
        type              = "scsi"
        disk_size         = "${var.vm_os_disk_size}"
        cache_mode        = "none"
        format            = "qcow2"
    }

    template_name         = "${var.vm_name_debian}"
    template_description  = ""
    unmount_iso           = "true"
    qemu_agent            = "true"

    # Communicator Configuration
    communicator           = "ssh"
    ssh_username           = "dadmin"
    ssh_password           = "${var.linuxadmin_password}"
    ssh_handshake_attempts = "20"
    ssh_timeout           = "1h30m"

}