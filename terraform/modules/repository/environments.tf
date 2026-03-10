resource "github_repository_environment" "github_pages" {
  count = lookup(var.config, "enable_pages", false) ? 1 : 0

  environment = "github-pages"
  repository  = github_repository.this.name

  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = false
  }
}
