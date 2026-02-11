# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## General agent rules

- When users ask questions, answer them instead of doing the work.

### Shell Rules

- Always use `rm -f` (never bare `rm`)
- Run `git` commands in the current directory (do not use the `-C` option)

## Project Overview

This is a GitHub Terraform configuration management repository that uses Infrastructure as Code (IaC) to manage GitHub repositories, settings, and configurations. The project uses a Task-based architecture for development workflow and Terraform Cloud for state management.

## Architecture

The project uses a modular Task architecture with the main `Taskfile.yml` including specialized task files from the `tasks/` directory:

- **MiseTasks.yml**: Tool management and setup
- **YamlTasks.yml**: YAML linting and validation
- **JsonTasks.yml**: JSON formatting and linting using Biome
- **MarkdownTasks.yml**: Markdown linting with auto-fix capabilities
- **GitHubTasks.yml**: GitHub Actions workflow validation
- **TerraformTasks.yml**: Terraform operations (init, plan, apply, validate, format)

## Development Commands

### Setup

```bash
task setup    # Setup project and install tools via mise
# or
task s       # Alias for setup
```

### Common Development Tasks

```bash
task                    # Show default tasks and versions
task list              # List all available tasks
task select-run        # Interactive task selection with fzf
task sr               # Alias for select-run
task check            # Run all checks (YAML, JSON, Markdown, GitHub Actions, Terraform)
task c                # Alias for check
```

### Individual Linting/Formatting

```bash
# YAML
task yml:lint         # Lint YAML files with yamllint

# JSON
task json:fmt         # Format JSON files with Biome
task json:lint        # Lint JSON files with Biome

# Markdown
task md:lint          # Lint Markdown files
task md:fix           # Auto-fix Markdown issues

# GitHub Actions
task gh:validate-workflow  # Validate GitHub Actions workflows with actionlint

# Terraform
task tf:init              # Initialize Terraform
task tf:plan              # Plan Terraform changes
task tf:apply             # Apply Terraform changes
task tf:validate          # Validate Terraform configuration
task tf:fmt               # Format Terraform files
task tf:check             # Run all Terraform checks (validate + format check)
task tf:import:repo:REPO  # Import existing repository (e.g., task tf:import:repo:my-repo)
```

## Tool Management

The project uses `mise` for tool version management. Tools are defined in `mise.toml`:

- yamllint (YAML linting)
- markdownlint-cli (Markdown linting)
- biome (JSON formatting/linting)
- actionlint (GitHub Actions validation)
- shellcheck (shell script validation)
- terraform (Infrastructure as Code)
- fzf (fuzzy finder for task selection)

## Configuration Files

- `biome.jsonc`: Biome configuration for JSON formatting (120 char line width, space indentation)
- `.yamllint.yml`: yamllint configuration
- `.markdownlint.yml`: markdownlint configuration
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
   task setup    # Install required tools via mise
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
   task tf:init    # This creates the workspace automatically
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
   task tf:plan     # Preview changes
   task tf:apply    # Apply changes
   ```

## Repository Management

- **Add Repository**: Add entry to `terraform/repositories.tf`
- **Modify Settings**: Update repository configuration in the same file
- **Apply Changes**: Run `task tf:plan` then `task tf:apply`

All repositories are automatically configured with:

- Main branch protection using Repository Rules
- Consistent merge settings
- Actions and workflow permissions

## References

- [GitHub Provider Documentation](https://registry.terraform.io/providers/integrations/github/latest) - Complete reference for all available resources and data sources

## CI/CD

GitHub Actions workflows in `.github/workflows/` handle:

- YAML validation
- JSON formatting/linting checks
- Markdown linting
- GitHub workflow validation
- Dependabot auto-approval and merging
- Upstream synchronization
