# variables.tf (ROOT)

variable "users" {
  type = map(object({
    username       = string
    ssh_public_key = string
  }))
}

variable "host" {
    description = "SSH host"
    type        = string
    default     = "127.0.0.1"
}

variable "port" {
    description = "SSH port"
    type        = number
    default     = 2222
}

variable "user" {
    description = "SSH user"
    type        = string
    default     = "vagrant"
}

variable "private_key_path" {
    description = "Path to SSH private key"
    type        = string
    default     = "./.vagrant/machines/default/virtualbox/private_key"
}


variable "vm_image_path" {
    description = "Path to a .vdi or .iso file for the VM"
    type        = string
    default     = "./images/Ubuntu.vdi"
}

variable "vm_cpus" {
    description = "Number of CPUs for the VM"
    type        = number
    default     = 2
}

variable "vm_memory" {
    description = "Memory size for the VM in MB"
    type        = number
    default     = 2048
}