$ErrorActionPreference = "Continue"
$ResourceGroup = "rg-entra-iam-lab"

Write-Host "AZURE ACCESS VALIDATION" -ForegroundColor Cyan
Write-Host "This script performs read-only checks."

try {
    $Context = Get-AzContext -ErrorAction Stop
    if (-not $Context -or -not $Context.Subscription) {
        throw "No active Azure context."
    }
    Write-Host "[PASS] Azure context is available." -ForegroundColor Green
}
catch {
    Write-Host "[FAIL] Azure context: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Remaining checks may fail until authentication is fixed."
}

try {
    $Resources = @(Get-AzResource -ResourceGroupName $ResourceGroup -ErrorAction Stop)
    Write-Host "[PASS] Resource inventory access. Resources found: $($Resources.Count)" -ForegroundColor Green
}
catch {
    Write-Host "[FAIL] Resource inventory access: $($_.Exception.Message)" -ForegroundColor Red
}

try {
    $Context = Get-AzContext -ErrorAction Stop
    if (-not $Context.Subscription) {
        throw "Subscription is unavailable."
    }
    $Scope = "/subscriptions/$($Context.Subscription.Id)/resourceGroups/$ResourceGroup"
    $Assignments = @(Get-AzRoleAssignment -Scope $Scope -ErrorAction Stop)
    Write-Host "[PASS] RBAC assignments are readable. Assignments returned: $($Assignments.Count)" -ForegroundColor Green
}
catch {
    Write-Host "[BLOCKED/FAIL] RBAC check: $($_.Exception.Message)" -ForegroundColor Yellow
}

Write-Host "`nValidation finished. Record actual output; do not assume all checks passed."
