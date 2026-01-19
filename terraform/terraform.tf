terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "23prime"
    workspaces {
      name = "github-management"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.10.1"
    }
  }
}
