# Define your repositories here
locals {
  # Define repositories with their specific configurations
  repositories = {
    "github-terraform" = {
      description              = "Manage GitHub repositories with Terraform"
      topics                   = ["terraform", "github", "automation"],
      enable_branch_protection = true
    },

    "23prime" = {
      description = "Personal GitHub profile"
      topics      = ["profile", "github"],
    },

    "oeis-mcp-server-rs" = {
      description = "Rust implementation of the OEIS MCP server"
      topics      = ["rust", "oeis", "mcp"],
    }

    "23prime.xyz" = {
      description  = "Personal website"
      homepage_url = "https://23prime.xyz"
      topics       = ["website"],
    }

    "aws-tfstate-manager" = {
      description = "Manage AWS S3 buckets for Terraform state files"
      topics      = ["terraform", "aws", "s3"]
    }

    "vscode-multi-root-workspaces-example" = {
      description  = "Example of VS Code multi-root workspaces"
      homepage_url = "https://zenn.dev/23prime/articles/25fa0667cdc2a5"
      topics       = ["vscode", "example"]
    }

    "mf-web-tools" = {
      description = "Tools for Money Forward Web"
      topics      = ["chrome-extension"]
    }

    "claude-launcher" = {
      description = "Launcher for Claude Code"
      topics      = ["cli", "ai", "claude"]
    }

    ".emacs.d" = {
      description = "Settings for Emacs."
      topics      = ["emacs", "emacs-lisp"]
    }

    "actix-onion-template" = {
      description = "Onion Architecture for Rust / Actix Web"
      topics      = ["rust", "actix-web", "onion-architecture", "template"]
    }

    "agent-skills" = {
    }

    "aws-lambda-functions-rs" = {
      description = "AWS Lambda functions by Rust and Terraform."
      topics      = ["aws", "lambda", "rust", "terraform", "docker"]
      archived    = true
    }

    "backlog-cli" = {
      description  = "An unofficial CLI tool for Nulab's Backlog"
      homepage_url = "https://23prime.github.io/backlog-cli/"
      topics       = ["cli", "rust", "nulab", "backlog"]
      enable_pages = true
    }

    "claude-config" = {
      description              = ""
      topics                   = []
      visibility               = "private"
      enable_branch_protection = false
    }

    "copier-template" = {
      description = "Copier template for general projects."
      topics      = ["copier", "template"]
      archived    = true
    }

    "dot-config" = {
      description = "Configuration files at `~/.config`."
      topics      = []
    }

    "danime-open-video-in-new-tab" = {
      description = ""
      topics      = []
    }

    "dotfiles" = {
      description = "Dot Files"
      topics      = []
    }

    "elliptic-curve" = {
      description = "Elliptic curve library for Haskell"
      topics      = ["haskell", "elliptic-curves", "ellipse", "algebra"]
    }

    "gh-download" = {
      description = ""
      topics      = []
    }

    "git-config" = {
      description = ""
      topics      = []
    }

    "gokabot" = {
      description = "Gokabot"
      topics      = ["line", "line-bot", "ruby", "sinatra", "gokabou"]
    }

    "kdfj" = {
      description = "Let's go to Kadofuji!"
      topics      = ["ramen", "tsukuba"]
    }

    "latex-semantic-parser" = {
      description = ""
      topics      = []
      archived    = true
    }

    "mikutter_keyword_mute" = {
      description = "keyword-mute plugin for mikutter"
      topics      = ["ruby", "mikutter", "mikutter-plugin"]
      archived    = true
    }

    "oeis2" = {
      description = "Interface for Online Encyclopedia of Integer Sequences (OEIS)."
      topics      = ["haskell", "oeis"]
    }

    "paper-template" = {
      description = ""
      topics      = ["latex-template", "latex"]
      archived    = true
    }

    "proxy-terraform" = {
      description = ""
      topics      = []
    }

    "scripts" = {
      description = "Shell Scripts."
      topics      = ["shell", "shell-script"]
      archived    = true
    }

    "shell-scripts" = {
      description = ""
      topics      = []
    }

    "simple-commit-and-push" = {
      description = ""
      topics      = []
    }

    "simple-dependabot-auto-approve-and-merge" = {
      description = ""
      topics      = []
    }

    "sync-upstream" = {
      description = ""
      topics      = []
    }

    "mise-template" = {
      description = ""
      topics      = []
    }

    "notes" = {
      description = "Knowledge base and notes"
      topics      = ["markdown", "notes"]
    }

    "vscode-snippets" = {
      description = "My snippets for Visual Studio Code"
      topics      = ["vscode", "snippets"]
    }

    "youtube-open-stream-thumbnail" = {
      description = ""
      topics      = []
      archived    = true
    }

    "youtube-open-stream-thumbnail-vue" = {
      description = ""
      topics      = []
      archived    = true
    }

    "zed-config" = {
      description = "Configuration for Zed editor"
      topics      = []
    }

    "zism" = {
      description = "Zellij Interactive Session Manager"
      topics      = ["zellij", "rust"]
    }

    "md-section-numbers-checker" = {
      description = "A tool to check section numbers in Markdown files"
      topics      = ["markdown", "documentation", "tool"]
    }

    # Archived repositories

    "23prime-api" = {
      description            = "Backend Web API for 23prime-page"
      homepage_url           = "https://github.com/23prime/23prime-page"
      topics                 = ["rust", "actix", "actix-web", "seaorm", "docker"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "23prime-page" = {
      description            = "My web site."
      homepage_url           = "https://23prime.xyz"
      topics                 = ["nuxt", "vue", "auth0", "openid-connect"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "PRS" = {
      description            = "Calculate PRS"
      homepage_url           = ""
      topics                 = ["prs", "python3", "sympy"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "aws-lambda-functions" = {
      description            = "AWS Lambda Functions."
      homepage_url           = ""
      topics                 = ["aws", "aws-lambda", "ruby", "aws-lambda-func"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "completion-judgment" = {
      description            = "Completion Judgment Machine"
      homepage_url           = ""
      topics                 = ["rust"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "db-csv" = {
      description            = ""
      homepage_url           = ""
      topics                 = []
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "diet" = {
      description            = "Let's diet!"
      homepage_url           = ""
      topics                 = ["python", "python3"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "diet-tweet" = {
      description            = ""
      homepage_url           = ""
      topics                 = ["haskell", "twitter", "oauth"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "follow-list" = {
      description            = "Fit follow list to follow."
      homepage_url           = ""
      topics                 = ["rust", "twitter"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "gakuryoku-saiten" = {
      description            = ""
      homepage_url           = ""
      topics                 = ["haskell", "stack", "csv"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "json-tools" = {
      description            = ""
      homepage_url           = ""
      topics                 = []
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "linear-algebra-rust" = {
      description            = ""
      homepage_url           = ""
      topics                 = ["rust", "linear-algebra", "matrix"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "okkey-room" = {
      description            = ""
      homepage_url           = "https://23prime.github.io/okkey-room/"
      topics                 = ["markdown", "homepage"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "py-math" = {
      description            = ""
      homepage_url           = ""
      topics                 = []
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "shuryo-judge" = {
      description            = "Judge whether you can shuryo or not."
      homepage_url           = "https://shuryo-judge.herokuapp.com/"
      topics                 = ["haskell", "yesod"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
    }

    "sos-page" = {
      description            = "Official website of high school girl band \"Stream of Semen\" "
      homepage_url           = "https://sos-pages.herokuapp.com/"
      topics                 = ["rust", "rocket"]
      allow_squash_merge     = true
      allow_rebase_merge     = true
      allow_auto_merge       = false
      delete_branch_on_merge = false
      has_projects           = true
      has_wiki               = true
      archived               = true
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
  vulnerability_alerts               = var.vulnerability_alerts
  enable_dependabot_security_updates = var.enable_dependabot_security_updates

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
