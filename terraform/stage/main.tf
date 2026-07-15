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


module "ubuntu_stage" {
    source = "../modules/proxmox_vm"
    target_node = var.virtual_environment_node_name
    ubuntu_template_id = var.ubuntu_template_id

    vm_name = "ubuntu-stage"
    ip_address = "10.10.10.243/24"
    gateway = "10.10.10.2"
    datastore_id = var.datastore_id
    vm_memory = 4096



}
