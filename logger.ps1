function Init-Log {
    $global:logFile = ".\logs\log_$(Get-Date -Format yyyyMMdd_HHmmss).txt"
}

function Write-Log($msg) {
    $time = Get-Date -Format "HH:mm:ss"
    "$time - $msg" | Out-File -Append $global:logFile
}
