---
name: add-repo
description: Add a new GitHub repository to Terraform management. Creates a feature branch, edits repositories.tf, creates a PR, and applies after user review. Use when the user wants to add or register a repository in Terraform.
---

# Add Repository Skill

Adds a new GitHub repository to the Terraform configuration, creates a PR, and optionally applies after review.

## Usage

```txt
/add-repo <repo-name>
```

## Instruction

When the user invokes `/add-repo <repo-name>`, follow these steps:

### 1. Gather repository information

Ask the user for the following (all optional — sensible defaults will be used):

- **description**: Repository description (default: `""`)
- **topics**: List of topics (default: `[]`)
- **visibility**: `"public"` or `"private"` (default: use root variable default, i.e. `"public"`)
- **auto_init**: Whether to auto-initialize (default: `false` for existing repos, `true` for new repos)
- **enable_branch_protection**: Whether to enable branch protection (default: use root variable default, i.e. `true`)
- **homepage_url**: Homepage URL (default: omit)

If the user provides these inline (e.g. `/add-repo my-repo description="My repo" topics=["go"]`), use those values directly without asking.

### 2. Create a feature branch

```bash
git switch main
git pull origin main
git switch -c add-repo/<repo-name>
```

### 3. Edit `terraform/repositories.tf`

Add a new entry to the `local.repositories` map in `terraform/repositories.tf`. Insert it in alphabetical order among existing entries. Follow the existing code style:

```hcl
    "<repo-name>" = {
      description = "<description>"
      topics      = [<topics>]
      auto_init   = false
    }
```

Only include fields that differ from the root variable defaults. For example, omit `enable_branch_protection` if the user wants the default (`true`).

### 4. Fix and Check

```bash
mise run tf-fix
mise run tf-check
```

If validation fails, fix the issue and retry.

### 5. Commit and create PR

```bash
git add terraform/repositories.tf
git commit -m "Add <repo-name> to Terraform management"
git push -u origin add-repo/<repo-name>
```

Create a PR using `gh pr create` with the PR template (`.github/PULL_REQUEST_TEMPLATE.md`). Fill in the template sections:

- **Title**: `Add <repo-name> to Terraform management`
- **Summary**: Description of the repository being added and its configuration
- **Notes**: Any additional context if relevant

Leave the checklist items unchecked — the user will check them during review.

### 6. Wait for user review

Tell the user the PR has been created and share the URL. Ask them to review and approve. Wait for explicit confirmation before proceeding.

### 7. Apply Terraform changes

Once the user confirms:

```bash
mise run tf-init
mise run tf-plan
```

Show the plan output to the user. If the user approves:

```bash
mise run tf-apply
```

### 8. Clean up

After successful apply, inform the user that the repository has been added to Terraform management.
