provider "github" {
  owner = var.github_owner
}

# Data source to get current user information
data "github_user" "current" {
  username = var.github_owner
}
