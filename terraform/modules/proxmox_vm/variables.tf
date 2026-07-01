variable "target_node" {
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

variable "vm_name" {
    type = string
    description = "Virtual Machine hostname"
}

variable "vm_memory" {
    type = number
    description = "Virtual Machine memory"
}