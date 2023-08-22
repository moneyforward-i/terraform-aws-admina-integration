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

variable "read_only" {
  type        = bool
  default     = false
  description = "If true, the role will be read only."
}
