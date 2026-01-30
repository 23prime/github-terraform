resource "github_repository_ruleset" "main_branch_protection" {
  count = lookup(var.config, "enable_branch_protection", true) ? 1 : 0

  name        = "main-branch-protection"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  dynamic "bypass_actors" {
    for_each = lookup(var.config, "deny_admin_bypass", false) ? [] : [1]
    content {
      actor_id    = 5 # admin
      actor_type  = "RepositoryRole"
      bypass_mode = "always"
    }
  }

  rules {
    # Prevent force pushes
    non_fast_forward = true

    # Require pull request reviews
    pull_request {
      dismiss_stale_reviews_on_push   = lookup(var.config, "dismiss_stale_reviews", true)
      require_code_owner_review       = lookup(var.config, "require_code_owner_reviews", false)
      required_approving_review_count = lookup(var.config, "required_approving_review_count", 1)
      require_last_push_approval      = lookup(var.config, "require_last_push_approval", false)
    }

    # Require status checks to pass
    required_status_checks {
      strict_required_status_checks_policy = lookup(var.config, "strict_status_checks", false)
      required_check {
        context = "check"
      }
    }

    # Prevent deletion of the branch
    deletion = true

    # Require conversation resolution
    required_linear_history = lookup(var.config, "require_linear_history", false)
  }
}
