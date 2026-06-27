---
name: rename-repo
description: Rename a GitHub repository under Terraform management. Use when the user wants to rename a repository that is already managed by Terraform.
---

# Rename Repository Skill

Renames a GitHub repository by moving the Terraform state entry and updating the configuration.

## Usage

```txt
/rename-repo <old-name> <new-name>
```

## Background

The map key in `terraform/repositories.tf` doubles as the Terraform state key.
Changing the key alone causes a destroy + create cycle.
Moving the state entry first avoids this.

## Instruction

### 1. Move the Terraform state entry

```bash
mise run tf-state-mv-repo <old-name> <new-name>
```

### 2. Update `terraform/repositories.tf`

Rename the map key from `"<old-name>"` to `"<new-name>"`.

### 3. Fix and verify

```bash
mise run tf-fix
mise run tf-plan
```

Confirm the plan shows only an update (name change) — no destroy or create.

### 4. Apply

```bash
mise run tf-apply
```
