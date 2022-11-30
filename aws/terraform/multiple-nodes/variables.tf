variable "resource_name_prefix" {
  description = "The prefix name for AWS resources (Default: fermyon)"
  type        = string
  default     = "fermyon"
}

variable "instance_type" {
  description = "The type of EC2 Instance to run for each node in the cluster (Default: t2.medium)"
  type        = string
  default     = "t2.medium"
}

variable "server_count" {
  description = "Number of servers (Default: 3)"
  type        = number
  default     = 3
}

variable "bindle_disk_size" {
  description = "Bindle disk size (Default: 20GB)"
  type        = number
  default     = 20
}

variable "postgres_disk_size" {
  description = "Postgres disk size (Default: 20GB)"
  type        = number
  default     = 20
}

variable "enable_letsencrypt" {
  description = "Enable cert provisioning via Let's Encrypt"
  type        = bool
  default     = false
}

variable "dns_host" {
  description = "The DNS host to use for construction of the root domain for Fermyon Platform services and apps"
  type        = string
  default     = "sslip.io"
}

variable "allowed_ssh_cidr_blocks" {
  description = "A list of CIDR-formatted IP address ranges from which the EC2 Instance will allow SSH connections"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_inbound_cidr_blocks" {
  description = "A list of CIDR-formatted IP address ranges from which the EC2 Instance will allow connections"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_outbound_cidr_blocks" {
  description = "Allow outbound traffic to these CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_inbound_http_nomad" {
  description = "Allow inbound connections to the unsecured Nomad API http port"
  type        = bool
  default     = false
}

variable "allow_inbound_http_consul" {
  description = "Allow inbound connections to the unsecured Consul API http port"
  type        = bool
  default     = false
}

variable "hippo_admin_username" {
  description = "Admin username for Hippo when running in AdministratorOnly mode"
  type        = string
  default     = "admin"
}

variable "hippo_registration_mode" {
  description = "The registration mode for Hippo. Options are 'Open', 'Closed' and 'AdministratorOnly'. (Default: AdministratorOnly)"
  type        = string
  default     = "AdministratorOnly"

  validation {
    condition     = var.hippo_registration_mode == "Open" || var.hippo_registration_mode == "Closed" || var.hippo_registration_mode == "AdministratorOnly"
    error_message = "The Hippo registration mode must be 'Open', 'Closed' or 'AdministratorOnly'."
  }
}
