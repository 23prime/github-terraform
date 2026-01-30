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

# Security
variable "vulnerability_alerts" {
  description = "Enable vulnerability alerts by default"
  type        = bool
}

# Auto-initialize
variable "auto_init" {
  description = "Auto-initialize repositories by default"
  type        = bool
}

variable "gitignore_template" {
  description = "Gitignore template by default"
  type        = string
}

variable "license_template" {
  description = "License template by default"
  type        = string
}

# Branch protection
variable "enable_branch_protection" {
  description = "Enable branch protection by default"
  type        = bool
}

variable "deny_admin_bypass" {
  description = "Deny admin bypass by default"
  type        = bool
}

variable "dismiss_stale_reviews" {
  description = "Dismiss stale reviews on push by default"
  type        = bool
}

variable "require_code_owner_reviews" {
  description = "Require code owner reviews by default"
  type        = bool
}

variable "required_approving_review_count" {
  description = "Required approving review count by default"
  type        = number
}

variable "require_last_push_approval" {
  description = "Require last push approval by default"
  type        = bool
}

variable "strict_status_checks" {
  description = "Strict required status checks policy by default"
  type        = bool
}

variable "require_linear_history" {
  description = "Require linear history by default"
  type        = bool
}

# Permissions
variable "allowed_actions" {
  description = "Allowed actions by default"
  type        = string
}

variable "default_workflow_permissions" {
  description = "Default workflow permissions by default"
  type        = string
}

variable "can_approve_pull_request_reviews" {
  description = "Can approve pull request reviews by default"
  type        = bool
}
