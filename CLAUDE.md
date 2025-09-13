# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a GitHub Terraform configuration management repository that uses a Task-based architecture for development workflow. The project focuses on maintaining configuration files for GitHub management using Terraform.

## Architecture

The project uses a modular Task architecture with the main `Taskfile.yml` including specialized task files from the `tasks/` directory:

- **MiseTasks.yml**: Tool management and setup
- **YamlTasks.yml**: YAML linting and validation
- **JsonTasks.yml**: JSON formatting and linting using Biome
- **MarkdownTasks.yml**: Markdown linting with auto-fix capabilities
- **GitHubTasks.yml**: GitHub Actions workflow validation

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
task check            # Run all checks (YAML, JSON, Markdown, GitHub Actions)
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
```

## Tool Management

The project uses `mise` for tool version management. Tools are defined in `mise.toml`:

- yamllint (YAML linting)
- markdownlint-cli (Markdown linting)
- biome (JSON formatting/linting)
- actionlint (GitHub Actions validation)
- shellcheck (shell script validation)
- fzf (fuzzy finder for task selection)

## Configuration Files

- `biome.jsonc`: Biome configuration for JSON formatting (120 char line width, space indentation)
- `.yamllint.yml`: yamllint configuration
- `.markdownlint.yml`: markdownlint configuration
- `.editorconfig`: Editor configuration

## CI/CD

GitHub Actions workflows in `.github/workflows/` handle:

- YAML validation
- JSON formatting/linting checks
- Markdown linting
- GitHub workflow validation
- Dependabot auto-approval and merging
- Upstream synchronization
