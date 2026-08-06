---
name: delete-repo
description: Delete a GitHub repository managed by Terraform. Removes the entry from repositories.tf, creates a PR, and destroys the repository on GitHub after user review. Use when the user wants to delete a repository that is managed by Terraform.
---

# Delete Repository Skill

Deletes a GitHub repository by removing its entry from the Terraform configuration, creating a PR, and applying after review.

## Usage

```txt
/delete-repo <repo-name>
```

## Warning

The repository module does not set `archive_on_destroy`, so `mise run tf-apply` deletes the repository on GitHub — code, issues, pull requests, and releases go with it.

Two similar operations are **not** this skill:

- **Keep the repository, stop managing it with Terraform** — run `mise run tf-exclude-repo <repo-name>` first, then remove the entry. The plan must then show no changes.
- **Keep the repository, make it read-only** — add `archived = true` to the entry instead of removing it.

## Instruction

When the user invokes `/delete-repo <repo-name>`, follow these steps:

### 1. Confirm the deletion

Show the `"<repo-name>"` entry as currently defined in `terraform/repositories.tf`, and confirm the user wants the repository deleted from GitHub rather than one of the alternatives above. Wait for explicit confirmation before continuing.

Deletion also requires the `delete_repo` scope on the `GITHUB_TOKEN` stored in the Terraform Cloud workspace. The `repo` scope alone is not enough — apply fails with a permission error at step 8.

### 2. Create a feature branch

```bash
git switch main
git pull origin main
git switch -c delete-repo/<repo-name>
```

### 3. Edit `terraform/repositories.tf`

Remove the `"<repo-name>"` entry from the `local.repositories` map. Leave the surrounding entries untouched.

### 4. Fix and check

```bash
mise run tf-fix
mise run tf-check
```

If validation fails, fix the issue and retry.

### 5. Verify the plan

```bash
mise run tf-init
mise run tf-plan
```

Every destroyed resource must be under `module.repository["<repo-name>"]`. Which of the module's resources appear depends on the entry's config, so derive the expected set from the module rather than trusting the table below:

```bash
rg -n '^resource|^\s*count\s*=' terraform/modules/repository/*.tf
```

| Resource | Destroyed when |
| --- | --- |
| `github_repository.this` | always |
| `github_repository_vulnerability_alerts.this[0]` | not archived |
| `github_repository_dependabot_security_updates.this[0]` | not archived |
| `github_repository_ruleset.main_branch_protection[0]` | not archived and branch protection enabled |
| `github_actions_repository_permissions.this[0]` | not archived |
| `github_workflow_repository_permissions.this[0]` | not archived |
| `github_repository_pages.this[0]` | `enable_pages` |
| `github_repository_environment.github_pages[0]` | `enable_pages` |

Show the plan output to the user. If anything outside that module instance is added, changed, or destroyed, stop and report it instead of continuing. If the table and the module disagree, update the table in this skill.

### 6. Commit and create PR

```bash
git add terraform/repositories.tf
git commit -m "Delete <repo-name> from Terraform management"
git push -u origin delete-repo/<repo-name>
```

Create a PR using `gh pr create` with the PR template (`.github/PULL_REQUEST_TEMPLATE.md`). Fill in the template sections:

- **Title**: `Delete <repo-name> from Terraform management`
- **Summary**: The repository being deleted, and that applying this PR deletes it on GitHub
- **Notes**: The destroy summary line from the plan (e.g. `Plan: 0 to add, 0 to change, 6 to destroy.`)

Leave the checklist items unchecked — the user will check them during review.

### 7. Wait for user review

Tell the user the PR has been created and share the URL. Ask them to review and approve. Wait for explicit confirmation before proceeding.

### 8. Apply Terraform changes

Once the user confirms:

```bash
mise run tf-plan
```

Show the plan output again — it must still match step 5. If the user approves:

```bash
mise run tf-apply
```

### 9. Clean up

Verify the repository is gone:

```bash
gh repo view <github-owner>/<repo-name>
```

This should fail with a not-found error. Inform the user that the repository has been deleted.
