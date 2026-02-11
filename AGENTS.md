# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## General agent rules

- When users ask questions, answer them instead of doing the work.

### Shell Rules

- Always use `rm -f` (never bare `rm`)
- Run `git` commands in the current directory (do not use the `-C` option)

## Project Overview

This is a GitHub Terraform configuration management repository that uses Infrastructure as Code (IaC) to manage GitHub repositories, settings, and configurations. The project uses mise for both tool management and task running, and Terraform Cloud for state management.

## Architecture

The project uses `mise.toml` for tool version management and task definitions. All tasks are defined in `mise.toml` using the TOML task format.

Task categories:

- **Global**: `setup`, `fix`, `check`, `fix-and-check`
- **Markdown**: `md-fix`, `md-check`
- **GitHub Actions**: `gh-check`
- **Terraform**: `tf-init`, `tf-plan`, `tf-apply`, `tf-fix`, `tf-check`, etc.

## Development Commands

### Setup

```bash
mise run setup    # Setup project and install tools via mise
# or
mise run s       # Alias for setup
```

### Common Development Tasks

```bash
mise tasks              # List all available tasks
mise run check          # Run all checks (Markdown, GitHub Actions, Terraform)
mise run c              # Alias for check
mise run fix            # Fix all issues (Markdown, Terraform formatting)
mise run f              # Alias for fix
mise run fix-and-check  # Fix all issues and then check
mise run fc             # Alias for fix-and-check
```

### Individual Linting/Formatting

```bash
# Markdown
mise run md-check     # Check for Markdown issues
mise run md-fix       # Auto-fix Markdown issues

# GitHub Actions
mise run gh-check     # Validate GitHub Actions workflows with actionlint

# Terraform
mise run tf-init              # Initialize Terraform
mise run tf-plan              # Plan Terraform changes
mise run tf-apply             # Apply Terraform changes
mise run tf-fix               # Format Terraform files
mise run tf-check             # Run all Terraform checks (validate + format check)
mise run tf-import-repo REPO  # Import existing repository (e.g., mise run tf-import-repo my-repo)
```

## Tool Management

The project uses `mise` for tool version management. Tools are defined in `mise.toml`:

- markdownlint-cli2 (Markdown linting)
- actionlint (GitHub Actions validation)
- shellcheck (shell script validation)
- terraform (Infrastructure as Code)
- lefthook (git hooks)

## Configuration Files

- `.markdownlint-cli2.jsonc`: markdownlint-cli2 configuration
- `.editorconfig`: Editor configuration

## Terraform Structure

All Terraform configuration files are located in the `terraform/` directory:

- `terraform/terraform.tf`: Terraform Cloud backend and provider configuration
- `terraform/variables.tf`: Input variables and default values for repository configuration
- `terraform/main.tf`: GitHub provider setup and data sources
- `terraform/repositories.tf`: `local.repositories` definitions and `module "repository"` calls
- `terraform/outputs.tf`: Terraform output values
- `terraform/terraform.tfvars.example`: Example variables file

### Repository Module (`terraform/modules/repository/`)

Each repository is managed by a reusable module that bundles:

- `main.tf`: `github_repository` resource
- `ruleset.tf`: `github_repository_ruleset` resource (branch protection)
- `permissions.tf`: `github_actions_repository_permissions` and `github_workflow_repository_permissions` resources
- `variables.tf`: Module input variables (no defaults; all defaults are defined in root `variables.tf`)
- `outputs.tf`: Module outputs

Default values for all repository settings are centralized in the root `terraform/variables.tf`. Per-repository overrides are specified in the `local.repositories` config map in `terraform/repositories.tf`.

## Getting Started with Terraform

1. **Setup Tools**:

   ```bash
   mise run setup    # Install required tools via mise
   ```

2. **Setup Terraform Cloud**:
   - Create account at <https://app.terraform.io>
   - Create organization
   - Update `terraform/terraform.tf` with your organization name

3. **Terraform Login**:

   ```bash
   terraform login    # Authenticate with Terraform Cloud
   ```

4. **Initialize Terraform**:

   ```bash
   mise run tf-init    # This creates the workspace automatically
   ```

5. **Setup GitHub Token**:
   - Create GitHub Personal Access Token with `repo` permissions
   - Go to Terraform Cloud → Your Workspace → Variables
   - Add Environment Variable: `GITHUB_TOKEN` (mark as Sensitive)

6. **Configure Variables**:

   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
   # Edit terraform.tfvars with your settings
   ```

7. **Define Repositories**:
   Edit `terraform/repositories.tf` and uncomment/customize the repository definitions in the `local.repositories` block

8. **Deploy**:

   ```bash
   mise run tf-plan     # Preview changes
   mise run tf-apply    # Apply changes
   ```

## Repository Management

- **Add Repository**: Add entry to `terraform/repositories.tf`
- **Modify Settings**: Update repository configuration in the same file
- **Apply Changes**: Run `mise run tf-plan` then `mise run tf-apply`

All repositories are automatically configured with:

- Main branch protection using Repository Rules
- Consistent merge settings
- Actions and workflow permissions

## References

- [GitHub Provider Documentation](https://registry.terraform.io/providers/integrations/github/latest) - Complete reference for all available resources and data sources

## CI/CD

GitHub Actions workflows in `.github/workflows/` handle:

- Markdown linting
- GitHub workflow validation
- Terraform validation and formatting
- Dependabot auto-approval and merging
- Upstream synchronization
