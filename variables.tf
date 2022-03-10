variable "openstack_compute_instance_v2_flavor_name" {
  description = "Instance type"
  type        = string
  default     = ""
}

variable "openstack_compute_keypair_v2_public_key" {
  description = "SSH public key"
  type        = string
  default     = ""
}