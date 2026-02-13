variable "additional_tags" {
  type        = map(string)
  description = "A mapping of additional resource tags"
  default     = {}
}

variable "role_path" {
  type        = string
  default     = "/integration/"
  description = "Path to place the Role."
}

variable "permission_scope" {
  type        = string
  default     = "full"
  description = "Permission scope for the integration role. Use 'full' for read-write access (provisioning/deprovisioning enabled) or 'read' for read-only access."

  validation {
    condition     = contains(["full", "read"], var.permission_scope)
    error_message = "permission_scope must be either 'full' or 'read'."
  }
}

