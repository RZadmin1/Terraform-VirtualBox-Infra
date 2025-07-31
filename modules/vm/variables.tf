# modules\vm\variables.tf

variable "vm_name" {
    type    = string
    default = "dev-vm"
}

variable "vm_image_path" {
    type        = string
    description = "Path to a .vdi or .iso file for the VM"
}

variable "vm_cpus" {
    type    = number
    default = 2
}

variable "vm_memory" {
    type    = number
    default = 2048
}
