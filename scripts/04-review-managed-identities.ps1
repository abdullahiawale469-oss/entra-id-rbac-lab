$ErrorActionPreference = "Continue"
$ResourceGroup = "rg-entra-iam-lab"

try {
    $Apps = Get-AzWebApp -ResourceGroupName $ResourceGroup -ErrorAction Stop

    foreach ($App in $Apps) {
        Write-Host "`nApp Service: $($App.Name)" -ForegroundColor Cyan
        $Identity = $App.Identity

        if ($Identity -and $Identity.PrincipalId) {
            [PSCustomObject]@{
                ResourceGroup = $ResourceGroup
                AppName       = $App.Name
                IdentityType  = $Identity.Type
                PrincipalId   = $Identity.PrincipalId
                HasIdentity   = $true
            } | Format-List
        }
        else {
            [PSCustomObject]@{
                ResourceGroup = $ResourceGroup
                AppName       = $App.Name
                IdentityType  = "None"
                PrincipalId   = "None"
                HasIdentity   = $false
            } | Format-List
        }
    }

    Write-Host "Identity inspection completed. No resources were changed."
}
catch {
    Write-Host "Could not inspect App Services in '$ResourceGroup': $($_.Exception.Message)" -ForegroundColor Yellow
}
