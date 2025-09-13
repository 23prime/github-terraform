# GitHub Terraform

Infrastructure as Code (IaC) repository for managing GitHub repositories, settings, and configurations using Terraform with Terraform Cloud state management.

## Usage

### Setup

1. **Setup Tools**

   ```bash
   task setup
   ```

2. **Setup Terraform Cloud**
   - Create account at [Terraform Cloud](https://app.terraform.io)
   - Create organization
   - Update `terraform/terraform.tf` with your organization name

3. **Terraform Login**

   ```bash
   terraform login    # Authenticate with Terraform Cloud
   ```

4. **Initialize Terraform**

   ```bash
   task tf:init    # This creates the workspace automatically
   ```

5. **Setup GitHub Token**
   - Go to [GitHub / Fine-grained personal access tokens](https://github.com/settings/personal-access-tokens)
   - Create GitHub Personal Access Token with `repo` permissions
   - Go to [Terraform Cloud / Your Workspace / Variables](https://app.terraform.io/app/23prime/workspaces/github-management/variables)
   - Add Environment Variable: `GITHUB_TOKEN` (mark as Sensitive)

### Configuration

1. **Configure Variables**

   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
   # Edit terraform.tfvars with your settings
   ```

2. **Define Repositories**
   Edit `terraform/repositories.tf` and uncomment/customize the repository definitions:

   ```hcl
   repositories = {
     "my-project" = {
       description = "My awesome project"
       visibility  = "public"
       topics      = ["terraform", "automation"]
       has_issues  = true
     }
   }
   ```

### Common Commands

```bash
# Preview changes
task tf:plan

# Apply changes
task tf:apply

# Check all (includes Terraform validation)
task check
```

### Repository Management

#### Creating New Repositories

- **Add Repository**: Add entry to `terraform/repositories.tf`
- **Modify Settings**: Update repository configuration in the same file
- **Apply Changes**: Run `task tf:plan` then `task tf:apply`

#### Importing Existing Repositories

To manage existing GitHub repositories with Terraform:

1. **Add Repository Definition**
   Add the repository to `terraform/repositories.tf` with `auto_init = false`:

   ```hcl
   "existing-repo" = {
     description = "My existing repository"
     visibility  = "public"
     auto_init   = false  # Important: Don't initialize existing repos
   }
   ```

2. **Import Repository**

   ```bash
   task tf:import:repo:existing-repo
   ```

3. **Import Labels (if needed)**

   ```bash
   # Import each existing label
   terraform import 'github_issue_label.standard_labels["existing-repo-bug"]' existing-repo:bug
   terraform import 'github_issue_label.standard_labels["existing-repo-feature"]' existing-repo:feature
   # Repeat for other labels...
   ```

4. **Import Branch Protection (if exists)**

   ```bash
   terraform import 'github_branch_protection.main_branch_protection["existing-repo"]' existing-repo:main
   ```

5. **Verify and Apply**

   ```bash
   task tf:plan    # Should show no changes if import was successful
   task tf:apply   # Apply any additional configurations
   ```

All repositories are automatically configured with:

- Standard labels (bug, feature, priority levels, etc.)
- Branch protection on main branch
- Consistent merge settings

## References

- [GitHub Provider Documentation](https://registry.terraform.io/providers/integrations/github/latest/docs) - Complete reference for all available resources and data sources
