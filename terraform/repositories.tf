# Define your repositories here
# Example repository configurations

locals {
  # Define repositories with their specific configurations
  repositories = {
    "github-terraform" = {
      description              = "Manage GitHub repositories with Terraform"
      topics                   = ["terraform", "github", "automation"],
      auto_init                = false
      enable_branch_protection = true
    },

    "oeis-mcp-server-rs" = {
      description = "Rust implementation of the OEIS MCP server"
      topics      = ["rust", "oeis", "mcp"],
    }

    "23prime.xyz" = {
      description  = "Personal website"
      homepage_url = "https://23prime.xyz"
      topics       = ["website"],
      auto_init    = false
    }

    "aws-tfstate-manager" = {
      description = "Manage AWS S3 buckets for Terraform state files"
      topics      = ["terraform", "aws", "s3"]
      auto_init   = false
    }
  }
}

# Create repositories
resource "github_repository" "repositories" {
  for_each = local.repositories

  name         = each.key
  description  = lookup(each.value, "description", "")
  visibility   = lookup(each.value, "visibility", var.default_visibility)
  homepage_url = lookup(each.value, "homepage_url", "https://github.com/${var.github_owner}/${each.key}")
  topics       = lookup(each.value, "topics", [])

  # Repository features
  has_issues      = lookup(each.value, "has_issues", var.enable_issues)
  has_projects    = lookup(each.value, "has_projects", var.enable_projects)
  has_wiki        = lookup(each.value, "has_wiki", var.enable_wiki)
  has_discussions = lookup(each.value, "has_discussions", var.enable_discussions)
  has_downloads   = lookup(each.value, "has_downloads", true)

  # Merge settings
  delete_branch_on_merge = lookup(each.value, "delete_branch_on_merge", var.delete_branch_on_merge)
  allow_squash_merge     = lookup(each.value, "allow_squash_merge", var.allow_squash_merge)
  allow_merge_commit     = lookup(each.value, "allow_merge_commit", var.allow_merge_commit)
  allow_rebase_merge     = lookup(each.value, "allow_rebase_merge", var.allow_rebase_merge)
  allow_update_branch    = lookup(each.value, "allow_update_branch", var.allow_update_branch)
  allow_auto_merge       = lookup(each.value, "allow_auto_merge", var.allow_auto_merge)

  # Security
  vulnerability_alerts = lookup(each.value, "vulnerability_alerts", true)

  # Auto-initialize (only for new repositories)
  auto_init          = lookup(each.value, "auto_init", true)
  gitignore_template = lookup(each.value, "gitignore_template", null)
  license_template   = lookup(each.value, "license_template", null)
}
