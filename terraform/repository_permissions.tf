# Repository permissions configuration

resource "github_actions_repository_permissions" "actions_repository_permissions" {
  for_each        = local.repositories
  repository      = github_repository.repositories[each.key].name
  allowed_actions = "all"
  depends_on      = [github_repository.repositories]
}

resource "github_workflow_repository_permissions" "workflow_repository_permissions" {
  for_each                         = local.repositories
  repository                       = github_repository.repositories[each.key].name
  default_workflow_permissions     = "read"
  can_approve_pull_request_reviews = true
  depends_on                       = [github_repository.repositories]
}
