
$basePath = "$PSScriptRoot"

# CORE
. "$basePath\core\logger.ps1"
. "$basePath\core\safety.ps1"
. "$basePath\core\updater.ps1"
. "$basePath\config.ps1"
. "$basePath\profiles.ps1"

Init-Log
Write-Log "STARTING TOOL"

Start-SafetyCheck

# =========================
# AUTO UPDATE CHECK
# =========================

Check-ForUpdate

# =========================
# MENU
# =========================

Write-Host "`n=== WINDOWS OPTIMIZER PRO ===`n"

foreach ($p in $profilesInfo.Keys) {
    Write-Host "$p - $($profilesInfo[$p].Description)"
}

$choice = Read-Host "`nSelect profile"

if (-not $profilesInfo.ContainsKey($choice)) {
    Write-Host "Invalid profile"
    exit
}

$modules = $profilesInfo[$choice].Modules

Write-Log "Profile: $choice"

# EXECUTION
foreach ($m in $modules) {

    $path = "$basePath\modules\$m"

    if (Test-Path $path) {
        Write-Host "Running $m"
        . $path
        Invoke-Module
        Write-Log "Executed $m"
    }
}

Write-Host "`nDone!"
Write-Log "FINISHED"
