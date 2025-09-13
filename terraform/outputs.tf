output "github_user_info" {
  description = "GitHub user information"
  value = {
    login        = data.github_user.current.login
    name         = data.github_user.current.name
    public_repos = data.github_user.current.public_repos
    bio          = data.github_user.current.bio
  }
}

output "managed_repositories" {
  description = "List of managed repositories"
  value = [
    for repo in github_repository.repositories : {
      name          = repo.name
      full_name     = repo.full_name
      html_url      = repo.html_url
      ssh_clone_url = repo.ssh_clone_url
      git_clone_url = repo.git_clone_url
      visibility    = repo.visibility
    }
  ]
}
