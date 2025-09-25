# Repository rulesets for main branch protection
locals {
  # Define which repositories should have main branch protection
  protected_repositories = {
    for repo_name, config in local.repositories :
    repo_name => config
    if lookup(config, "enable_branch_protection", true)
  }
}

resource "github_repository_ruleset" "main_branch_protection" {
  for_each = local.protected_repositories

  name        = "main-branch-protection"
  repository  = github_repository.repositories[each.key].name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  dynamic "bypass_actors" {
    for_each = lookup(each.value, "deny_admin_bypass", false) ? [] : [1]
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
      dismiss_stale_reviews_on_push   = lookup(each.value, "dismiss_stale_reviews", true)
      require_code_owner_review       = lookup(each.value, "require_code_owner_reviews", false)
      required_approving_review_count = lookup(each.value, "required_approving_review_count", 1)
      require_last_push_approval      = lookup(each.value, "require_last_push_approval", false)
    }

    # Require status checks to pass
    required_status_checks {
      strict_required_status_checks_policy = lookup(each.value, "strict_status_checks", false)
      required_check {
        context = "check"
      }
    }

    # Prevent deletion of the branch
    deletion = true

    # Require conversation resolution
    required_linear_history = lookup(each.value, "require_linear_history", false)
  }

  depends_on = [github_repository.repositories]
}
