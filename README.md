# Entra ID and Azure RBAC Security Review Lab

## Overview
This portfolio project demonstrates practical Azure security review tasks using Azure PowerShell. It focuses on resource inventory, Azure role-based access control (RBAC), managed identities, and access validation.

## Objectives
- Verify the active Azure PowerShell context.
- Inventory Azure resources and resource groups.
- Review Azure RBAC role assignments where permissions allow.
- Inspect App Service managed identity configuration.
- Document access-validation results and permission limitations.
- Maintain evidence screenshots for a security portfolio.

## Environment
- Microsoft Azure
- Azure PowerShell (`Az` module)
- Microsoft Entra ID concepts
- Azure Role-Based Access Control (RBAC)
- Azure App Service managed identities
- PowerShell

## Project Structure
```text
entra-id-rbac-lab/
├── README.md
├── .gitignore
├── scripts/
│   ├── 01-check-azure-context.ps1
│   ├── 02-inventory-resources.ps1
│   ├── 03-review-rbac.ps1
│   ├── 04-review-managed-identities.ps1
│   └── 05-access-validation.ps1
├── docs/
│   ├── lab-steps.md
│   ├── security-review.md
│   └── validation-results.md
└── evidence/
    └── screenshots/
```

## How to Run
Open PowerShell and navigate to the project directory:

```powershell
Set-Location "$HOME/entra-id-rbac-lab"
```

If authentication is available in your environment, check the Azure context:

```powershell
./scripts/01-check-azure-context.ps1
```

Run the resource inventory:

```powershell
./scripts/02-inventory-resources.ps1
```

Review role assignments:

```powershell
./scripts/03-review-rbac.ps1
```

Inspect managed identities:

```powershell
./scripts/04-review-managed-identities.ps1
```

Run access validation:

```powershell
./scripts/05-access-validation.ps1
```

Scripts are intended for read-only review. They do not create, modify, or delete Azure resources.

## Evidence
Place genuine screenshots in `evidence/screenshots/`. Suggested evidence:
- `01-azure-context.png`
- `02-entra-users.png`
- `03-rbac-role-assignments.png`
- `04-managed-identity.png`
- `05-access-validation.png`

Screenshots should show actual results. Do not represent a failed or blocked check as successful.

## Security Notes
- RBAC review requires suitable Azure permissions and valid authentication.
- A configured managed identity does not by itself prove that the identity can access a resource.
- Access-denied and authentication errors must be documented rather than reported as successful validation.
- Never commit passwords, access tokens, private keys, client secrets, or sensitive exports.
- Redact subscription and tenant identifiers from public screenshots if you do not want them disclosed.

## Current Limitations
The earlier RBAC review encountered an Azure Managed Identity authentication error. Therefore, a complete RBAC review has not yet been confirmed. Access-validation results must be updated based on actual script output.

## Author
Cybersecurity portfolio project focused on Azure administration, IAM, RBAC, and cloud security review.
