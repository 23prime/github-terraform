resource "github_repository" "this" {
  name         = var.name
  description  = lookup(var.config, "description", "")
  visibility   = lookup(var.config, "visibility", var.visibility)
  homepage_url = lookup(var.config, "homepage_url", "https://github.com/${var.github_owner}/${var.name}")
  topics       = lookup(var.config, "topics", [])

  # Repository features
  has_issues      = lookup(var.config, "has_issues", var.enable_issues)
  has_projects    = lookup(var.config, "has_projects", var.enable_projects)
  has_wiki        = lookup(var.config, "has_wiki", var.enable_wiki)
  has_discussions = lookup(var.config, "has_discussions", var.enable_discussions)

  # Merge settings
  delete_branch_on_merge = lookup(var.config, "delete_branch_on_merge", var.delete_branch_on_merge)
  allow_squash_merge     = lookup(var.config, "allow_squash_merge", var.allow_squash_merge)
  allow_merge_commit     = lookup(var.config, "allow_merge_commit", var.allow_merge_commit)
  allow_rebase_merge     = lookup(var.config, "allow_rebase_merge", var.allow_rebase_merge)
  allow_update_branch    = lookup(var.config, "allow_update_branch", var.allow_update_branch)
  allow_auto_merge       = lookup(var.config, "allow_auto_merge", var.allow_auto_merge)

  # Security
  vulnerability_alerts = lookup(var.config, "vulnerability_alerts", var.vulnerability_alerts)

  # Auto-initialize (only for new repositories)
  auto_init          = lookup(var.config, "auto_init", var.auto_init)
  gitignore_template = lookup(var.config, "gitignore_template", var.gitignore_template)
  license_template   = lookup(var.config, "license_template", var.license_template)
}
