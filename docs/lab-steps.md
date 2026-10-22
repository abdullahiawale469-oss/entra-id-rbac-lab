# Lab Steps

## 1. Verify the Azure context
Run `scripts/01-check-azure-context.ps1`. Confirm that the expected account, tenant, and subscription are shown. Do not publish sensitive identifiers unnecessarily.

## 2. Inventory resources
Run `scripts/02-inventory-resources.ps1`. Review resource groups, resource names, types, and regions.

## 3. Review RBAC
Run `scripts/03-review-rbac.ps1`. Review role assignments only where the current identity has permission. An authentication error or access-denied response means the review is incomplete.

## 4. Inspect managed identities
Run `scripts/04-review-managed-identities.ps1`. Check whether the target App Service has a system-assigned identity and record its principal ID privately if needed.

## 5. Validate access
Run `scripts/05-access-validation.ps1`. Save a screenshot of the real output and document each check as PASS, FAIL, or BLOCKED.

## Safety
These scripts are designed for read-only inspection. Do not add secrets or real credentials to the repository.
