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
    for key, mod in module.repository : {
      name          = mod.repository.name
      full_name     = mod.repository.full_name
      html_url      = mod.repository.html_url
      ssh_clone_url = mod.repository.ssh_clone_url
      git_clone_url = mod.repository.git_clone_url
      visibility    = mod.repository.visibility
    }
  ]
}
