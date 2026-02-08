# Define your repositories here
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

    "agent-skills" = {
      auto_init = false
    }

    "aws-lambda-functions-rs" = {
      description = "AWS Lambda functions by Rust and Terraform."
      topics      = ["aws", "lambda", "rust", "terraform", "docker"]
      auto_init   = false
    }

    "claude-config" = {
      description              = ""
      topics                   = []
      visibility               = "private"
      auto_init                = false
      enable_branch_protection = false
    }

    "copier-template" = {
      description = "Copier template for general projects."
      topics      = ["copier", "template"]
      auto_init   = false
    }

    "dot-config" = {
      description = "Configuration files at `~/.config`."
      topics      = []
      auto_init   = false
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

    "md-section-numbers-checker" = {
      description = "A tool to check section numbers in Markdown files"
      topics      = ["markdown", "documentation", "tool"]
      auto_init   = false
    }
  }
}

module "repository" {
  source   = "./modules/repository"
  for_each = local.repositories

  name         = each.key
  config       = each.value
  github_owner = var.github_owner

  visibility             = var.visibility
  enable_issues          = var.enable_issues
  enable_projects        = var.enable_projects
  enable_wiki            = var.enable_wiki
  enable_discussions     = var.enable_discussions
  delete_branch_on_merge = var.delete_branch_on_merge
  allow_squash_merge     = var.allow_squash_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_update_branch    = var.allow_update_branch
  allow_auto_merge       = var.allow_auto_merge

  # Security
  vulnerability_alerts = var.vulnerability_alerts

  # Auto-initialize
  auto_init          = var.auto_init
  gitignore_template = var.gitignore_template
  license_template   = var.license_template

  # Branch protection
  enable_branch_protection         = var.enable_branch_protection
  deny_admin_bypass                = var.deny_admin_bypass
  dismiss_stale_reviews            = var.dismiss_stale_reviews
  require_code_owner_reviews       = var.require_code_owner_reviews
  required_approving_review_count  = var.required_approving_review_count
  require_last_push_approval       = var.require_last_push_approval
  strict_status_checks             = var.strict_status_checks
  require_review_thread_resolution = var.require_review_thread_resolution
  require_linear_history           = var.require_linear_history

  # Permissions
  allowed_actions                  = var.allowed_actions
  default_workflow_permissions     = var.default_workflow_permissions
  can_approve_pull_request_reviews = var.can_approve_pull_request_reviews
}
