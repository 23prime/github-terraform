resource "github_repository_ruleset" "main_branch_protection" {
  count = lookup(var.config, "enable_branch_protection", var.enable_branch_protection) ? 1 : 0

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
    for_each = lookup(var.config, "deny_admin_bypass", var.deny_admin_bypass) ? [] : [1]
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
      dismiss_stale_reviews_on_push   = lookup(var.config, "dismiss_stale_reviews", var.dismiss_stale_reviews)
      require_code_owner_review       = lookup(var.config, "require_code_owner_reviews", var.require_code_owner_reviews)
      required_approving_review_count = lookup(var.config, "required_approving_review_count", var.required_approving_review_count)
      require_last_push_approval      = lookup(var.config, "require_last_push_approval", var.require_last_push_approval)
    }

    # Require status checks to pass
    required_status_checks {
      strict_required_status_checks_policy = lookup(var.config, "strict_status_checks", var.strict_status_checks)
      required_check {
        context = "check"
      }
    }

    # Prevent deletion of the branch
    deletion = true

    # Require conversation resolution
    required_linear_history = lookup(var.config, "require_linear_history", var.require_linear_history)
  }
}
