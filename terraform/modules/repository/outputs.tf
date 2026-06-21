output "repository" {
  description = "The GitHub repository resource"
  value = {
    name          = github_repository.this.name
    full_name     = github_repository.this.full_name
    html_url      = github_repository.this.html_url
    ssh_clone_url = github_repository.this.ssh_clone_url
    git_clone_url = github_repository.this.git_clone_url
    visibility    = github_repository.this.visibility
  }
}
