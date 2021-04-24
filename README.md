# Packer templates for Ubuntu and Debian using Proxmox-ISO provider

## Note: this code is compatible with Packer v1.7.x or later.

This repository contains **HashiCorp Packer** templates to deploy **Ubuntu** and **Debian** in **Proxmox VE**, using the **proxmox-iso** builder.

These templates create the Template (or VM) directly on the Proxmox server and install the latest Qemu Guest Agent.

# Content: #

* [./ubuntu/http/meta-data](./ubuntu/http/meta-data) --> empty file needed for ubuntu subiquity
* [./ubuntu/http/user-data](./ubuntu/http/user-data) --> Answer file for unattended Ubuntu setup
* [./debian/http/preseed.cfg](./debian/http/preseed.cfg) --> Answer file for unattended Debian setup
* [builds.linux.pkr.hcl](builds.linux.pkr.hcl) --> Contains configuration for a specific combination of builders, provisioners, and post-processors used to create the Linux image artifact
* [source.ubuntu.pkr.hcl](source.ubuntu.pkr.hcl) --> Contains configuration for Ubuntu builder plugins
* [source.debian.pkr.hcl](source.debian.pkr.hcl) --> Contains configuration for Debian builder plugins.
* [variables.linux.pkr.hcl](variables.ubuntu.pkr.hcl) --> Contains configuration for variables related to Ubuntu and Debian Templates


Tested with **Proxmox VE 6.3**

# Requirements: #

* Packer --> https://www.packer.io

# How to use: #
export env variables(example below):

```
 export PROXMOX_URL=https://10.10.10.10:8006/api2/json
 export PROXMOX_USER=packer@pve
 export PROXMOX_PASSWORD="Enter Password"
 export PROXMOX_NODE_NAME="pve-node1"
 export LINUXADMIN_PASSWORD="Password"
```

execute **packer build .** --> To build all templates\
execute **packer build -only "*.ubuntu" .** --> For Ubuntu\
execute **packer build -only "*.debian" .** --> For Debian

* Use -force if you want to override the template/vm\
* Use -debug if you want to see the debug information

# NOTES: #

* Ubuntu "uadmin" PASSWORD needs to be changed, currently set as Password in preseed.cfg (encrypted with crypt) for easy template creation.
* Debian "dadmin" PASSWORD needs to be changed, currently set as Password in user-data  (encrypted with crypt) for easy template creation.
