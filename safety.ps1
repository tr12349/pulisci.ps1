
function Start-SafetyCheck {

    if (-not ([Security.Principal.WindowsPrincipal] `
        [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {

        Write-Host "Run as Administrator!"
        exit
    }

    try {
        Checkpoint-Computer -Description "Pre-Optimization Backup" -RestorePointType "MODIFY_SETTINGS"
        Write-Host "Restore point created"
    }
    catch {
        Write-Host "WARNING: Restore point not available on this system"
        Write-Host "Continuing safely..."
    }
}
