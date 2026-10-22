$ErrorActionPreference = "Continue"

try {
    $Context = Get-AzContext
    if (-not $Context -or -not $Context.Subscription) {
        throw "No active Azure context."
    }

    $SubscriptionId = $Context.Subscription.Id
    $Scopes = @(
        "/subscriptions/$SubscriptionId",
        "/subscriptions/$SubscriptionId/resourceGroups/rg-entra-iam-lab"
    )

    foreach ($Scope in $Scopes) {
        Write-Host "`nRBAC REVIEW: $Scope" -ForegroundColor Cyan
        try {
            Get-AzRoleAssignment -Scope $Scope -ErrorAction Stop |
                Select-Object DisplayName, SignInName, RoleDefinitionName, Scope |
                Format-Table -AutoSize
        }
        catch {
            Write-Host "REVIEW BLOCKED: $($_.Exception.Message)" -ForegroundColor Yellow
        }
    }

    Write-Host "`nReview attempt completed. Verify output and permissions."
}
catch {
    Write-Host "RBAC review could not start: $($_.Exception.Message)" -ForegroundColor Red
}
