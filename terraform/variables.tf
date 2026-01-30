variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
  default     = ""
}

variable "default_branch" {
  description = "Default branch name for repositories"
  type        = string
  default     = "main"
}

variable "visibility" {
  description = "Visibility for repositories by default"
  type        = string
  default     = "public"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility must be either 'public' or 'private'."
  }
}

variable "enable_issues" {
  description = "Enable issues on repositories by default"
  type        = bool
  default     = true
}

variable "enable_projects" {
  description = "Enable projects on repositories by default"
  type        = bool
  default     = false
}

variable "enable_wiki" {
  description = "Enable wiki on repositories by default"
  type        = bool
  default     = false
}

variable "enable_discussions" {
  description = "Enable discussions on repositories by default"
  type        = bool
  default     = false
}

variable "delete_branch_on_merge" {
  description = "Delete branch on merge by default"
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "Allow squash merge by default"
  type        = bool
  default     = true
}

variable "allow_merge_commit" {
  description = "Allow merge commit by default"
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "Allow rebase merge by default"
  type        = bool
  default     = false
}

variable "allow_update_branch" {
  description = "Allow update branch by default"
  type        = bool
  default     = false
}


variable "allow_auto_merge" {
  description = "Allow auto merge by default"
  type        = bool
  default     = false
}
