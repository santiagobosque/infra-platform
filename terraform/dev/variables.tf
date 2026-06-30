variable "virtual_environment_endpoint" {
    type = string
    description = "Proxmox address"
}

variable "virtual_environment_api_token" {
    type = string
    description = "Proxmox api token"
    sensitive = true 

}

variable "virtual_environment_node_name" {
    type = string 
}

variable "ubuntu_template_id" {
    type = number
}

variable "ip_address" {
    type = string
    description = "Vm static ip adress"
}

variable "gateway" {
    type = string
    description = "vm gateway"
}

variable "datastore_id" {
    type = string
    description = "datastore name"
}