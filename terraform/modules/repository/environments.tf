resource "github_repository_environment" "github_pages" {
  count = lookup(var.config, "enable_pages", false) ? 1 : 0

  environment = "github-pages"
  repository  = github_repository.this.name
}

# Requires a GitHub App to be created in advance and its APP_ID / APP_PRIVATE_KEY
# registered as secrets in HCP Terraform before applying.
resource "github_repository_environment" "token_generation" {
  count = lookup(var.config, "enable_token_generation_env", false) ? 1 : 0

  environment = "token-generation"
  repository  = github_repository.this.name
}

resource "github_actions_environment_secret" "token_generation_app_id" {
  count = lookup(var.config, "enable_token_generation_env", false) ? 1 : 0

  repository      = github_repository.this.name
  environment     = github_repository_environment.token_generation[0].environment
  secret_name     = "APP_ID"
  plaintext_value = var.token_generation_app_id
}

resource "github_actions_environment_secret" "token_generation_app_private_key" {
  count = lookup(var.config, "enable_token_generation_env", false) ? 1 : 0

  repository      = github_repository.this.name
  environment     = github_repository_environment.token_generation[0].environment
  secret_name     = "APP_PRIVATE_KEY"
  plaintext_value = var.token_generation_app_private_key
}
