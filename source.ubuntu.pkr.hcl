source "proxmox" "ubuntu" {
    # Connection Configuration
    proxmox_url             = "${var.proxmox_url}"
    username                = "${var.proxmox_user}"
    password                = "${var.proxmox_password}"
    insecure_skip_tls_verify    = "true"
    node                    = "${var.proxmox_node}"

    # Location Configuration
    vm_name                 = "${var.vm_name_ubuntu}"
    vm_id                   = "9000"

    # Hardware Configuration
    sockets                 = "${var.vm_cpu_sockets}"
    cores                   = "${var.vm_cpu_cores}"
    memory                  = "${var.vm_mem_size}"
    cpu_type                = "${var.vm_cpu_type}"

    # Boot Configuration
    boot_command           = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<enter>"]
    boot_wait              = "5s"
    
    # Http directory Configuration
    http_directory         = "ubuntu/http"

    # ISO Configuration
    iso_checksum            = "file:https://releases.ubuntu.com/20.04/SHA256SUMS"
    iso_file                = "iso-store:iso/ubuntu-20.04.2-live-server-amd64.iso"
    #iso_url                 = "https://releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso"
    #iso_storage_pool        = "iso-store:iso"

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

    template_name         = "${var.vm_name_ubuntu}"
    template_description  = ""
    unmount_iso           = "true"
    qemu_agent            = "true"

    # Communicator Configuration
    communicator           = "ssh"
    ssh_username           = "uadmin"
    ssh_password           = "${var.linuxadmin_password}"
    ssh_handshake_attempts = "20"
    ssh_timeout           = "1h30m"

}
