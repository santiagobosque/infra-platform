terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.61.0" # Use the latest version
    }
  }
}

provider "proxmox" {
    endpoint = var.virtual_environment_endpoint

    api_token = var.virtual_environment_api_token

    insecure = true
}

resource "proxmox_virtual_environment_vm" "ubuntu_clone" {
  name      = "ubuntu-clone"
  node_name = var.virtual_environment_node_name

  clone {
    vm_id = var.ubuntu_template_id
  }

  agent {
    # NOTE: The agent is installed and enabled as part of the cloud-init configuration in the template VM, see cloud-config.tf
    # The working agent is *required* to retrieve the VM IP addresses.
    # If you are using a different cloud-init configuration, or a different clone source
    # that does not have the qemu-guest-agent installed, you may need to disable the `agent` below and remove the `vm_ipv4_address` output.
    # See https://bpg.sh/docs/resources/virtual_environment_vm#qemu-guest-agent for more details.
    enabled = true
  }

  memory {
    dedicated = 4096
  }

  initialization {
    dns {
      servers = ["9.9.9.9", "8.8.8.8"]
    }
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    datastore_id = var.datastore_id
    
  }
  network_device {
    bridge = "vmbr4010"
  }
}

output "vm_ipv4_address" {
  value = proxmox_virtual_environment_vm.ubuntu_clone.ipv4_addresses[1][0]
}