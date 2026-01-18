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

    "23prime" = {
      description = "Personal GitHub profile"
      topics      = ["profile", "github"],
      auto_init   = false
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

    "vscode-multi-root-workspaces-example" = {
      description  = "Example of VS Code multi-root workspaces"
      homepage_url = "https://zenn.dev/23prime/articles/25fa0667cdc2a5"
      topics       = ["vscode", "example"]
      auto_init    = false
    }

    "mf-web-tools" = {
      description = "Tools for Money Forward Web"
      topics      = ["chrome-extension"]
      auto_init   = false
    }

    "claude-launcher" = {
      description = "Launcher for Claude Code"
      topics      = ["cli", "ai", "claude"]
      auto_init   = false
    }

    ".emacs.d" = {
      description = "Settings for Emacs."
      topics      = ["emacs", "emacs-lisp"]
      auto_init   = false
    }

    "aws-lambda-functions-rs" = {
      description = "AWS Lambda functions by Rust and Terraform."
      topics      = ["aws", "lambda", "rust", "terrafo", "docker"]
      auto_init   = false
    }

    "claude-config" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "codex-config" = {
      description              = ""
      topics                   = []
      visibility               = "private"
      auto_init                = false
      enable_branch_protection = false
    }

    "danime-open-video-in-new-tab" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "dotfiles" = {
      description = "Dot Files"
      topics      = []
      auto_init   = false
    }

    "elliptic-curve" = {
      description = "Elliptic curve library for Haskell"
      topics      = ["haskell", "elliptic-curves", "ellipse", "algebra"]
      auto_init   = false
    }

    "gh-download" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "git-config" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "gokabot" = {
      description = "Gokabot"
      topics      = ["line", "line-bot", "ruby", "sinatra", "gokabou"]
      auto_init   = false
    }

    "kdfj" = {
      description = "Let's go to Kadofuji!"
      topics      = ["ramen", "tsukuba"]
      auto_init   = false
    }

    "latex-semantic-parser" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "mikutter_keyword_mute" = {
      description = "keyword-mute plugin for mikutter"
      topics      = ["ruby", "mikutter", "mikutter-plugin"]
      auto_init   = false
    }

    "oeis2" = {
      description = "Interface for Online Encyclopedia of Integer Sequences (OEIS)."
      topics      = ["haskell", "oeis"]
      auto_init   = false
    }

    "paper-template" = {
      description = ""
      topics      = ["latex-template", "latex"]
      auto_init   = false
    }

    "proxy-terraform" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "scripts" = {
      description = "Shell Scripts."
      topics      = ["shell", "shell-script"]
      auto_init   = false
    }

    "shell-scripts" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "simple-commit-and-push" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "simple-dependabot-auto-approve-and-merge" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "sync-upstream" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "taskfile-mise-template" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "vscode-snippets" = {
      description = "My snippets for Visual Studio Code"
      topics      = ["vscode", "snippets"]
      auto_init   = false
    }

    "youtube-open-stream-thumbnail" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "youtube-open-stream-thumbnail-vue" = {
      description = ""
      topics      = []
      auto_init   = false
    }

    "zed-config" = {
      description = "Configuration for Zed editor"
      topics      = []
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
