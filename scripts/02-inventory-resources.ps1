$ErrorActionPreference = "Stop"

try {
    $Context = Get-AzContext
    if (-not $Context -or -not $Context.Subscription) {
        throw "No active Azure context. Check authentication first."
    }

    Write-Host "`nRESOURCE GROUPS" -ForegroundColor Cyan
    Get-AzResourceGroup |
        Select-Object ResourceGroupName, Location, ProvisioningState |
        Format-Table -AutoSize

    Write-Host "`nAZURE RESOURCES" -ForegroundColor Cyan
    Get-AzResource |
        Select-Object Name, ResourceType, ResourceGroupName, Location |
        Format-Table -AutoSize

    Write-Host "Inventory completed. No resources were changed."
}
catch {
    Write-Host "Inventory failed: $($_.Exception.Message)" -ForegroundColor Red
}
