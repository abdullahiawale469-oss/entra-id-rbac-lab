$ErrorActionPreference = "Stop"

try {
    $Context = Get-AzContext
    if (-not $Context -or -not $Context.Subscription) {
        throw "No active Azure context or subscription found."
    }

    Write-Host "PASS: Azure context is available." -ForegroundColor Green
    Write-Host "Account: $($Context.Account.Id)"
    Write-Host "Tenant: $($Context.Tenant.Id)"
    Write-Host "Subscription: $($Context.Subscription.Name)"
}
catch {
    Write-Host "FAIL: Could not verify Azure context." -ForegroundColor Red
    Write-Host $_.Exception.Message
    Write-Host "Use Connect-AzAccount only if interactive sign-in is supported in this environment."
}
