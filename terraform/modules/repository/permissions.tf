# Repository permissions configuration

resource "github_actions_repository_permissions" "this" {
  repository      = github_repository.this.name
  allowed_actions = lookup(var.config, "allowed_actions", var.allowed_actions)
}

resource "github_workflow_repository_permissions" "this" {
  repository                       = github_repository.this.name
  default_workflow_permissions     = lookup(var.config, "default_workflow_permissions", var.default_workflow_permissions)
  can_approve_pull_request_reviews = lookup(var.config, "can_approve_pull_request_reviews", var.can_approve_pull_request_reviews)
}
