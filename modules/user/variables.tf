# modules\user\variables.tf


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

variable "ssh_public_key" {
    description = "SSH Public key content to inject into the user's autorized_keys"
    type        = string
    default     = ""
}

variable "username" {
    description = "Username to create"
    type        = string
    default     = "Unnamed_User"
}