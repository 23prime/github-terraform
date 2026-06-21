resource "github_repository_pages" "this" {
  count = lookup(var.config, "enable_pages", false) ? 1 : 0

  repository = github_repository.this.name
  build_type = "workflow"
}
