variable "name" {
  description = "Repository name"
  type        = string
}

variable "config" {
  description = "Repository configuration"
  type        = any
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

variable "visibility" {
  description = "Visibility for repositories by default"
  type        = string
}

variable "enable_issues" {
  description = "Enable issues on repositories by default"
  type        = bool
}

variable "enable_projects" {
  description = "Enable projects on repositories by default"
  type        = bool
}

variable "enable_wiki" {
  description = "Enable wiki on repositories by default"
  type        = bool
}

variable "enable_discussions" {
  description = "Enable discussions on repositories by default"
  type        = bool
}

variable "delete_branch_on_merge" {
  description = "Delete branch on merge by default"
  type        = bool
}

variable "allow_squash_merge" {
  description = "Allow squash merge by default"
  type        = bool
}

variable "allow_merge_commit" {
  description = "Allow merge commit by default"
  type        = bool
}

variable "allow_rebase_merge" {
  description = "Allow rebase merge by default"
  type        = bool
}

variable "allow_update_branch" {
  description = "Allow update branch by default"
  type        = bool
}

variable "allow_auto_merge" {
  description = "Allow auto merge by default"
  type        = bool
}
